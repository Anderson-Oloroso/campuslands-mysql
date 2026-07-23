# ✨ Solución ejercicio básico: 03

## _Henrik Anderson Oloroso García 💯_

### Creación de las tablas 📑
Para este ejercicio se crearon dos tablas relacionadas entre sí, las cuales permiten almacenar información sobre las skins de un videojuego shooter y la cantidad disponible de cada una en el inventario.

La primera tabla es `skin_shooter`, que cuenta con los siguientes campos:

- skind_id
- skin_name
- skin_description

La segunda tabla es `inventario_skins`, que cuenta con los siguientes campos:

- inventario_id
- skin_id
- skin_quantity

*El campo `skind_id` de la tabla `skin_shooter` está configurado como PK y como `AUTO_INCREMENT`, por lo que identifica de manera única cada skin y su valor se asignará automáticamente.*

*El campo `inventario_id` de la tabla `inventario_skins` también está configurado como PK y como `AUTO_INCREMENT`, por lo que identifica de manera única cada registro del inventario.*

*La tabla `inventario_skins` tiene una relación con la tabla `skin_shooter` mediante el campo `skin_id`, el cual funciona como FK y referencia al campo `skind_id` de la tabla `skin_shooter`.*

### Creación de registros 📝
Se insertaron 15 registros en la tabla `skin_shooter` con los siguientes campos:

- skin_name
- skin_description

También se insertaron 15 registros en la tabla `inventario_skins` con los siguientes campos:

- skin_id
- skin_quantity

*Los campos `skind_id` e `inventario_id` no se incluyeron directamente en los registros porque están configurados como PK y `AUTO_INCREMENT`, por ende, MySQL asignará automáticamente sus valores.*

*El campo `skin_id` de `inventario_skins` se utilizó para relacionar cada registro del inventario con una skin existente en la tabla `skin_shooter`.*

### Consultas ✅
Las consultas que se realizaron fueron:

- Seleccionar todos los registros de la tabla `skin_shooter` para visualizar todas las skins disponibles.
- Seleccionar todos los registros de la tabla `inventario_skins` para visualizar la información del inventario.
- Unir las tablas `skin_shooter` e `inventario_skins` mediante un `INNER JOIN` para mostrar el nombre, descripción y cantidad de cada skin.
- Seleccionar las skins que tienen una cantidad disponible mayor a `10` unidades.
- Seleccionar todas las skins junto con su cantidad disponible y ordenarlas de mayor a menor según la cantidad almacenada en el inventario.