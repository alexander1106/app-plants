from fastapi import FastAPI, UploadFile, File, HTTPException
from fastapi.responses import JSONResponse, HTMLResponse
from fastapi.middleware.cors import CORSMiddleware

from app.database import get_connection
from tensorflow.keras.models import load_model
from tensorflow.keras.preprocessing import image
import numpy as np
import pandas as pd
from PIL import Image, ImageOps
import io
import os
import joblib
import os
os.environ["CUDA_VISIBLE_DEVICES"] = "-1"
os.environ["TF_FORCE_GPU_ALLOW_GROWTH"] = "false"
# --- Permitir CORS ---
origins = [
    "https://app-plants-1.onrender.com"
]
# --- CONFIGURACIÓN GLOBAL ---
MODEL_PATH = "app/models/leaf_classifier_resnet50.keras"
MAPPING_DATA_PATH = "app/models/train.csv"
TARGET_SIZE = (128, 128)   # AJUSTA al tamaño que usaste en el entrenamiento

app = FastAPI(title="Clasificador de Hojas - API")

app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Variables globales
loaded_model = None
labels_map = {}
num_classes = None

# -----------------------
def load_resources():
    """Carga modelo y mapeo de etiquetas (se ejecuta en startup)."""
    global loaded_model, labels_map, num_classes

    # Cargar modelo
    try:
        loaded_model = load_model(MODEL_PATH)
        # si el modelo es Sequential o Functional, output_shape puede ser (None, n)
        try:
            num_classes = loaded_model.output_shape[1]
        except Exception:
            # fallback: si no aplica, usar tamaño de salida de la última capa
            num_classes = int(loaded_model.output_shape[-1])
        print(f"Modelo cargado. Clases esperadas: {num_classes}")
    except Exception as e:
        print(f"Error al cargar el modelo: {e}")
        raise RuntimeError("El modelo no pudo ser cargado. Asegúrate de que el archivo .keras exista y sea accesible.")

    # Cargar mapeo desde train.csv (campo 'species')
    try:
        if os.path.exists(MAPPING_DATA_PATH):
            train_df = pd.read_csv(MAPPING_DATA_PATH)
            class_names = sorted(train_df['species'].unique())
            labels_map = {i: name for i, name in enumerate(class_names)}
            if len(labels_map) != num_classes:
                print(f"ADVERTENCIA: Clases mapeadas ({len(labels_map)}) no coinciden con la salida del modelo ({num_classes}).")
        else:
            raise FileNotFoundError
    except FileNotFoundError:
        print(f"ADVERTENCIA: No se encontró {MAPPING_DATA_PATH}. Usando etiquetas genéricas.")
        labels_map = {i: f"species_{i+1}" for i in range(num_classes)}

# -----------------------
def prepare_image_from_bytes(image_bytes: bytes, target_size=TARGET_SIZE):
    """
    Convierte bytes a array listo para predecir:
    - asegura RGB (3 canales),
    - corrige EXIF orientation,
    - redimensiona,
    - normaliza (/255.0).
    """
    try:
        img = Image.open(io.BytesIO(image_bytes))

        # Ajustar orientación EXIF
        try:
            img = ImageOps.exif_transpose(img)
        except Exception:
            pass

        # Forzar RGB (quita canal alpha si existe)
        if img.mode != "RGB":
            img = img.convert("RGB")

        # Redimensionar
        img = img.resize(target_size)

        # Convertir a array igual que in notebook
        arr = image.img_to_array(img)  # H,W,C (C=3)
        arr = np.expand_dims(arr, axis=0)  # 1,H,W,C

        # Normalizar (AJUSTA si tu entrenamiento usó otra normalización)
        arr = arr.astype("float32") / 255.0

        return arr
    except Exception as e:
        raise HTTPException(status_code=400, detail=f"Error al procesar la imagen: {e}")

# -----------------------
@app.on_event("startup")
async def startup_event():
    load_resources()

# --- Endpoint predict ---
@app.post("/predict", tags=["Prediction"])
async def predict_leaf_species(file: UploadFile = File(...)):
    # Validar MIME type (acepta jpeg y png; png puede contener alpha)
    if not file.content_type.startswith("image/"):
        raise HTTPException(status_code=400, detail="El archivo no es una imagen.")

    image_bytes = await file.read()
    # Preprocesar
    try:
        processed_input = prepare_image_from_bytes(image_bytes, target_size=TARGET_SIZE)
    except HTTPException:
        raise
    except Exception as e:
        raise HTTPException(status_code=500, detail=f"Error en preprocesamiento: {e}")

    # Predecir
    try:
        preds = loaded_model.predict(processed_input)
    except Exception as e:
        raise HTTPException(status_code=500, detail=f"Error al predecir: {e}")

    # Interpretar salida (si tu modelo devuelve logits, aplica softmax)
    try:
        # si la salida ya es prob. usa directamente; si son logits, descomenta softmax
        # probs = tf.nn.softmax(preds[0]).numpy()
        probs = preds[0]
        top_idx = int(np.argmax(probs))
        top_prob = float(probs[top_idx])
        predicted_label = labels_map.get(top_idx, f"label_{top_idx}")
    except Exception as e:
        raise HTTPException(status_code=500, detail=f"Error al decodificar la predicción: {e}")

    # Respuesta
    return JSONResponse({
        "filename": file.filename,
        "prediction_index": top_idx,
        "species": predicted_label,
        "confidence": round(top_prob, 6)
    })

# --- Endpoint para probar upload desde navegador (evita CORS y file://) ---
@app.get("/upload", response_class=HTMLResponse)
def upload_form():
    return """
    <!doctype html>
    <html>
      <head>
        <meta charset="utf-8">
        <title>Subir imagen - LR Classifier</title>
      </head>

      <body>
        <h3>Subir imagen para clasificación</h3>

        <form id="f" enctype="multipart/form-data">
          <input type="file" id="file" name="file" accept="image/*" required>
          <button type="submit">Enviar</button>
        </form>

        <h4>Imagen subida:</h4>
        <img id="preview" src="" style="max-width:300px; display:none; border:1px solid #ccc; margin-top:10px;">

        <h4>Resultado:</h4>
        <pre id="out"></pre>

        <div id="link_detalle"></div>

        <script>
          // Mostrar previsualización
          document.getElementById('file').addEventListener('change', function(e) {
            const file = e.target.files[0];
            const img = document.getElementById('preview');
            img.src = URL.createObjectURL(file);
            img.style.display = 'block';
          });

          // Enviar al endpoint /predict
          document.getElementById('f').addEventListener('submit', async (e) => {
            e.preventDefault();

            const fd = new FormData();
            fd.append('file', document.getElementById('file').files[0]);

            document.getElementById('out').textContent = 'Procesando...';

            try {
              const res = await fetch('/predict', { method: 'POST', body: fd });
              const json = await res.json();
              document.getElementById('out').textContent = JSON.stringify(json, null, 2);

              // Crear enlace a especie_detalle
              if (json.species) {
                const species = encodeURIComponent(json.species);
                document.getElementById('link_detalle').innerHTML = `
                  <br>
                  <a href="/especie_detalle?nombre=${species}" 
                     style="font-size:18px; color:blue;">
                     Ver detalles de la especie: ${json.species}
                  </a>
                `;
              }


            } catch (err) {
              document.getElementById('out').textContent = 'Error: ' + err;
            }
          });
        </script>
      </body>
    </html>
    """

# --- Health check ---
@app.get("/", tags=["Health"])
async def health_check():
    return {"status": "ok", "message": "Leaf Classification API está funcionando."}



@app.get("/especie_detalle")
def especies_detalle(nombre: str):
    conn = get_connection()
    if conn is None:
        raise HTTPException(status_code=500, detail="Error conectando a MySQL.")

    cursor = conn.cursor(dictionary=True)

    query = """
        SELECT
            e.nombre_cientifico,
            e.nombres_comunes,

            CONCAT_WS(' > ',
                COALESCE(r.nombre_cientifico, ''),
                COALESCE(d.nombre_cientifico, ''),
                COALESCE(c.nombre_cientifico, ''),
                COALESCE(o.nombre_cientifico, ''),
                COALESCE(f.nombre_cientifico, ''),
                COALESCE(g.nombre_cientifico, ''),
                e.nombre_cientifico
            ) AS taxonomia,

            -- Región vinculada
            reg.nombre       AS region_nombre,
            reg.clima        AS region_clima,
            reg.altitud      AS region_altitud,
            reg.topografia   AS region_topografia,
            reg.descripcion  AS region_descripcion,

            -- Descubrimiento
            disc.descubridor AS descubridor,
            disc.fecha       AS fecha_descubrimiento,

            -- Cuidados
            cu.riego         AS cuidados_riego,
            cu.luz_solar     AS cuidados_luz_solar,
            cu.temperatura_ideal AS cuidados_temperatura_ideal,
            cu.poda          AS cuidados_poda,
            cu.abonado       AS cuidados_abonado,

            -- Usos
            GROUP_CONCAT(DISTINCT u.nombre ORDER BY u.nombre SEPARATOR ', ') AS usos,

            -- Propiedades químicas
            GROUP_CONCAT(
                DISTINCT CONCAT(
                    pq.nombre,
                    COALESCE(CONCAT(' (', epq.concentracion, ')'), '')
                )
                ORDER BY pq.nombre
                SEPARATOR '; '
            ) AS propiedades_quimicas

        FROM especie e
        LEFT JOIN genero g ON e.genero_id = g.id
        LEFT JOIN familia f ON g.familia_id = f.id
        LEFT JOIN orden o ON f.orden_id = o.id
        LEFT JOIN clase c ON o.clase_id = c.id
        LEFT JOIN division d ON c.division_id = d.id
        LEFT JOIN reino r ON d.reino_id = r.id

        LEFT JOIN region reg ON e.region_id = reg.id
        LEFT JOIN descubrimiento disc ON e.descubrimiento_id = disc.id
        LEFT JOIN cuidados cu ON e.cuidados_id = cu.id

        LEFT JOIN uso_especie ue ON e.id = ue.especie_id
        LEFT JOIN uso u ON ue.uso_id = u.id

        LEFT JOIN especie_propiedad_quimica epq ON e.id = epq.especie_id
        LEFT JOIN propiedades_quimicas pq ON epq.propiedad_id = pq.id

        WHERE e.nombre_cientifico = %s

        GROUP BY e.id;
    """

    cursor.execute(query, (nombre,))
    rows = cursor.fetchall()

    cursor.close()
    conn.close()

    return rows


@app.get("/especies")
def obtener_especies():
    conn = get_connection()
    if conn is None:
        raise HTTPException(status_code=500, detail="Error conectando a MySQL.")

    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT * FROM especie")
    rows = cursor.fetchall()

    cursor.close()
    conn.close()

    return rows