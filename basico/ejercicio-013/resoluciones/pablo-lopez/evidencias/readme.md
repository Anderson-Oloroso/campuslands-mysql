# Ejercicio 013 - Filtros por estado para catalogo de peliculas de miedo

## Autor
- Pablo López

## Descripción

Se creó una tabla llamada `peliculas` para administrar un catálogo de películas de miedo.

La información almacenada permite consultar películas disponibles y no disponibles.

También permite realizar filtros, ordenamientos, rankings y cálculos sobre las películas.

## Estructura

* `ddl/schema.sql`: crea la base de datos y la tabla.
* `dml/inserts.sql`: inserta los datos de prueba.
* `dql/consultas.sql`: contiene las consultas del catálogo.

## Validaciones

Se utilizaron restricciones `NOT NULL` y `CHECK`.

La columna `estado` solamente permite los valores `disponible` y `no_disponible`.

La duración debe ser mayor que cero.

La puntuación debe estar entre 0 y 10.

## Datos de prueba

Se agregaron 10 películas con diferentes géneros, directores, duraciones, puntuaciones y estados.

Los datos permiten comprobar correctamente los filtros por estado.

## Consultas

La solución incluye consultas para:

* Mostrar películas disponibles.
* Mostrar películas no disponibles.
* Crear un ranking por puntuación.
* Obtener el Top 5.
* Calcular la puntuación promedio por género.
* Buscar películas largas.
* Obtener un resumen general del catálogo.

## Ejecución

Los archivos deben ejecutarse en este orden:

1. `ddl/schema.sql`
2. `dml/inserts.sql`
3. `dql/consultas.sql`

## Decisiones técnicas

Se utilizó `INT` para la duración, `DECIMAL` para la puntuación, `VARCHAR` para los datos de texto y `DATE` para la fecha de estreno.

La columna `estado` permite practicar específicamente los filtros solicitados en el ejercicio.
