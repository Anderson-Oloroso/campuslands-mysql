# ✨ Solución ejercicio básico: 55

## _Henrik Anderson Oloroso García 💯_

### Creación de la tabla 📑

Se creó la tabla `formulas_quimicas` para gestionar los datos principales de la temática **laboratorio de formulas quimicas**.

La tabla cuenta con los siguientes campos:
- `formula_id` (Primary Key, Auto Increment)
- `nombre_formula`
- `categoria`
- `nivel_riesgo`
- `temperatura_optima`
- `estado`

### Creación de registros 📝

Se insertaron 10 registros realistas en la tabla `formulas_quimicas` con sus correspondientes categorías y valores.

### Consultas ✅

Las consultas realizadas incluyen:
- Seleccionar y ordenar registros por `temperatura_optima` de mayor a menor.
- Filtrar registros según estado activo.
- Agrupar por `categoria` obteniendo métricas con `COUNT` y `AVG`.
- Filtrar valores superiores a un umbral específico.
- Obtener el top 5 de mejores registros.
