# ✨ Solución ejercicio básico: 02

## _Henrik Anderson Oloroso García 💯_

### Creación de la tabla 📑
La tabla cuenta con los datos básicos del ranking de equipos de Battle Royale,
permitiendo almacenar la información relacionada con la posición de cada equipo,
sus puntos obtenidos y las cantidades de eliminaciones y muertes:

- id
- nombre_equipo
- puesto
- puntos
- cantidad_kills
- cantidad_muertes

*El campo `id` está configurado como PK y como `AUTO_INCREMENT`, por lo que identifica de manera única cada registro y su valor se asignará automáticamente.*

*Para esta tabla no se usaron relaciones.*

### Creación de registros 📝
Se insertaron 15 registros con únicamente los siguientes campos:

- nombre_equipo
- puesto
- puntos
- cantidad_kills
- cantidad_muertes

*El campo `id` no se incluyó en los registros porque está configurado como PK y `AUTO_INCREMENT`, por ende, MySQL asignará automáticamente un valor consecutivo a cada equipo.*

### Consultas ✅
Las consultas que se realizaron fueron:

- Seleccionar todos los registros de la tabla `rankingBR` y ordenarlos según el puesto de cada equipo.
- Seleccionar todos los equipos y ordenarlos por cantidad de puntos de forma descendente y, en caso de empate, por cantidad de kills.
- Seleccionar todos los equipos que tengan una cantidad de kills mayor a `100`.
- Seleccionar todos los equipos que tengan una cantidad de muertes menor a `80`.
- Seleccionar los equipos que tengan más de `2000` puntos y una cantidad de kills mayor a `90`.