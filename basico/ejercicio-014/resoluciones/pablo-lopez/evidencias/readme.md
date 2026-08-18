# Ejercicio 014 - Fechas basicas para saga de ciencia ficcion

## Descripción

Se creó una tabla llamada `peliculas` para almacenar información de una saga de ciencia ficción.

La solución utiliza fechas de estreno para realizar consultas cronológicas, filtros por periodos y obtener información sobre la primera y última película de la saga.

## Estructura

* `ddl/schema.sql`: creación de la base de datos y tabla.
* `dml/inserts.sql`: inserción de datos de prueba.
* `dql/consultas.sql`: consultas relacionadas con fechas y reportes.

## Validaciones

Se utilizaron restricciones `NOT NULL` y `CHECK`.

Las principales validaciones son:

* El número de episodio debe ser mayor que cero.
* La duración debe ser mayor que cero.
* La puntuación debe estar entre 0 y 10.
* El estado solamente puede ser `disponible` o `no_disponible`.

## Datos de prueba

Se agregaron 10 películas con fechas de estreno comprendidas entre 2015 y 2026.

Esto permite probar filtros por fecha, ordenamiento cronológico y agrupaciones por año.

## Consultas realizadas

La solución incluye consultas para:

* Ordenar las películas cronológicamente.
* Buscar películas estrenadas después de 2020.
* Filtrar películas estrenadas entre 2017 y 2023.
* Obtener la película más antigua.
* Obtener la película más reciente.
* Contar películas por año.
* Obtener un resumen general de la saga.

## Ejecución

Los scripts deben ejecutarse en este orden:

1. `ddl/schema.sql`
2. `dml/inserts.sql`
3. `dql/consultas.sql`

## Decisiones técnicas

Se utilizó `DATE` para almacenar las fechas de estreno porque solamente se necesita registrar el día de lanzamiento.

Se utilizó `DECIMAL` para las puntuaciones y `INT` para el episodio y la duración.
