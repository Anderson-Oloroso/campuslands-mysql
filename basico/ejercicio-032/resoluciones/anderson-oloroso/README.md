# ✨ Solución ejercicio básico: 32

## _Henrik Anderson Oloroso García 💯_

### Creación de la tabla 📑

Se creó la tabla `jugadores_br` para gestionar los datos principales de la temática **ranking battle royale**.

La tabla cuenta con los siguientes campos:
- `jugador_id` (Primary Key, Auto Increment)
- `nickname`
- `rango`
- `bajas_totales`
- `victorias`
- `estado`

### Creación de registros 📝

Se insertaron 10 registros realistas en la tabla `jugadores_br` con sus correspondientes categorías y valores.

### Consultas ✅

Las consultas realizadas incluyen:
- Seleccionar y ordenar registros por `victorias` de mayor a menor.
- Filtrar registros según estado activo.
- Agrupar por `rango` obteniendo métricas con `COUNT` y `AVG`.
- Filtrar valores superiores a un umbral específico.
- Obtener el top 5 de mejores registros.
