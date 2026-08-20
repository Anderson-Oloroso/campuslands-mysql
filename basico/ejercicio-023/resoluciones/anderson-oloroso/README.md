# ✨ Solución ejercicio básico: 23

## _Henrik Anderson Oloroso García 💯_

### Creación de la tabla 📑

Se creó la tabla `planos_arquitectura` para gestionar los datos principales de la temática **arquitectura 3D**.

La tabla cuenta con los siguientes campos:
- `plano_id` (Primary Key, Auto Increment)
- `nombre_proyecto`
- `tipo_estructura`
- `area_m2`
- `presupuesto_usd`
- `estado`

### Creación de registros 📝

Se insertaron 10 registros realistas en la tabla `planos_arquitectura` con sus correspondientes categorías y valores.

### Consultas ✅

Las consultas realizadas incluyen:
- Seleccionar y ordenar registros por `presupuesto_usd` de mayor a menor.
- Filtrar registros según estado activo.
- Agrupar por `tipo_estructura` obteniendo métricas con `COUNT` y `AVG`.
- Filtrar valores superiores a un umbral específico.
- Obtener el top 5 de mejores registros.
