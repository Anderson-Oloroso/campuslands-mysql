# ✨ Solución ejercicio básico: 24

## _Henrik Anderson Oloroso García 💯_

### Creación de la tabla 📑

Se creó la tabla `trabajos_soldadura` para gestionar los datos principales de la temática **soldadura**.

La tabla cuenta con los siguientes campos:
- `trabajo_id` (Primary Key, Auto Increment)
- `tipo_soldadura`
- `material_base`
- `espesor_mm`
- `costo_proyecto`
- `estado`

### Creación de registros 📝

Se insertaron 10 registros realistas en la tabla `trabajos_soldadura` con sus correspondientes categorías y valores.

### Consultas ✅

Las consultas realizadas incluyen:
- Seleccionar y ordenar registros por `costo_proyecto` de mayor a menor.
- Filtrar registros según estado activo.
- Agrupar por `material_base` obteniendo métricas con `COUNT` y `AVG`.
- Filtrar valores superiores a un umbral específico.
- Obtener el top 5 de mejores registros.
