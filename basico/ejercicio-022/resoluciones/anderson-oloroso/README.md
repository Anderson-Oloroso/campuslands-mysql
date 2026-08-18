# ✨ Solución ejercicio básico: 22

## _Henrik Anderson Oloroso García 💯_

### Creación de la tabla 📑

Se creó la tabla `modelos_3d` para gestionar los datos principales de la temática **animacion 3D**.

La tabla cuenta con los siguientes campos:
- `modelo_id` (Primary Key, Auto Increment)
- `nombre_modelo`
- `tipo_geometria`
- `numero_poligonos`
- `software_creacion`
- `estado`

### Creación de registros 📝

Se insertaron 10 registros realistas en la tabla `modelos_3d` con sus correspondientes categorías y valores.

### Consultas ✅

Las consultas realizadas incluyen:
- Seleccionar y ordenar registros por `software_creacion` de mayor a menor.
- Filtrar registros según estado activo.
- Agrupar por `tipo_geometria` obteniendo métricas con `COUNT` y `AVG`.
- Filtrar valores superiores a un umbral específico.
- Obtener el top 5 de mejores registros.
