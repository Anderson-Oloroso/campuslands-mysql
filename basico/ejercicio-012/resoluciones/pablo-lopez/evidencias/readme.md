# Ejercicio 012 - Modelado de entidad para playlist musical

## Autor

Pablo López

## Descripción

Se creó una entidad `playlists` para almacenar información organizada sobre playlists musicales.

La tabla permite registrar el nombre, género, descripción, cantidad de canciones, duración, estado y fecha de creación.

## Estructura

* `ddl/schema.sql`: crea la base de datos y la tabla `playlists`.
* `dml/inserts.sql`: inserta datos de prueba.
* `dql/consultas.sql`: contiene consultas para obtener información útil.

## Validaciones

Se utilizaron restricciones `NOT NULL` y `CHECK`.

Las validaciones principales son:

* La cantidad de canciones no puede ser negativa.
* La duración debe ser mayor que cero.
* El estado solamente puede ser `activa` o `inactiva`.

## Datos de prueba

Se agregaron 10 playlists con diferentes géneros, cantidades de canciones, duraciones y estados.

Esto permite probar filtros, ordenamientos, agrupaciones y cálculos.

## Ejecución

Los archivos deben ejecutarse en este orden:

1. `ddl/schema.sql`
2. `dml/inserts.sql`
3. `dql/consultas.sql`

## Decisiones técnicas

Se utilizó `INT` para identificadores y cantidad de canciones, `VARCHAR` para información textual, `DECIMAL` para representar la duración con precisión y `DATE` para la fecha de creación.

La entidad fue diseñada para mantener nombres claros y permitir consultas de reportes sobre las playlists.
