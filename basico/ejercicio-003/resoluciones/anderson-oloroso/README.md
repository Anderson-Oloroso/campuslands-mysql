# ✨ Solución ejercicio básico: 03

## _Henrik Anderson Oloroso García 💯_

### Creación de la tabla 📑

Se creó la tabla `armas_shooter` para gestionar los datos principales de la temática **inventario de skins shooter**.

La tabla cuenta con los siguientes campos:
- `arma_id` (Primary Key, Auto Increment)
- `nombre_arma`
- `tipo_arma`
- `daño_base`
- `cadencia`
- `estado`

### Creación de registros 📝

Se insertaron 10 registros realistas en la tabla `armas_shooter` con sus correspondientes categorías y valores.

### Consultas ✅

Las consultas realizadas incluyen:
- Seleccionar y ordenar registros por `cadencia` de mayor a menor.
- Filtrar registros según estado activo.
- Agrupar por `tipo_arma` obteniendo métricas con `COUNT` y `AVG`.
- Filtrar valores superiores a un umbral específico.
- Obtener el top 5 de mejores registros.
