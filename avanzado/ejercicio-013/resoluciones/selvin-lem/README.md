# Resolucion - Ejercicio 013 avanzado

## Tematica
Catalogo de peliculas de miedo

## Analisis breve
Se modela una relacion muchos a muchos entre peliculas_miedo y
actores_miedo mediante la tabla puente reparto_pelicula_actor
(clave primaria compuesta id_pelicula + id_actor, con FK hacia
ambas tablas). El actor Renata Solano participando en dos peliculas
sirve como caso limite para probar el HAVING COUNT(*) > 1.

## Como ejecutar
1. Ejecutar `ddl/schema.sql` para crear peliculas_miedo,
   actores_miedo y reparto_pelicula_actor.
2. Ejecutar `dml/inserts.sql` para insertar 5 peliculas, 6 actores
   y 10 relaciones de reparto.
3. Ejecutar `dql/consultas.sql` para correr las 5 consultas con
   JOIN, HAVING y filtros puntuales.
