# ✨ Solución ejercicio básico: 30

## _Henrik Anderson Oloroso García 💯_

### Creación de la tabla 📑

Se creó la tabla `streamers_equipo` para gestionar los datos principales de la temática **equipo de streaming**.

La tabla cuenta con los siguientes campos:
- `streamer_id` (Primary Key, Auto Increment)
- `nickname_streamer`
- `plataforma`
- `seguidores`
- `ingresos_mes`
- `estado`

### Creación de registros 📝

Se insertaron 10 registros realistas en la tabla `streamers_equipo` con sus correspondientes categorías y valores.

### Consultas ✅

Las consultas realizadas incluyen:
- Seleccionar y ordenar registros por `ingresos_mes` de mayor a menor.
- Filtrar registros según estado activo.
- Agrupar por `plataforma` obteniendo métricas con `COUNT` y `AVG`.
- Filtrar valores superiores a un umbral específico.
- Obtener el top 5 de mejores registros.
