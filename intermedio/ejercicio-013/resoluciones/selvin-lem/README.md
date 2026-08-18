# Resolucion - Ejercicio 013 (Intermedio)

## Tematica
catalogo de peliculas de miedo

## Analisis breve
Se modela un catalogo de peliculas de miedo con relacion muchos a
muchos entre peliculas_miedo y generos_miedo, resuelta mediante la
tabla puente pelicula_genero (clave primaria compuesta y llaves
foraneas hacia ambas tablas). Se practica el uso de la tabla puente
para listar peliculas con sus generos, contar peliculas por genero y
detectar el caso limite de un genero sin peliculas asociadas.

## Como ejecutar
1. Ejecutar `ddl/schema.sql` para crear peliculas_miedo,
   generos_miedo y la tabla puente pelicula_genero.
2. Ejecutar `dml/inserts.sql` para insertar peliculas, generos y sus
   relaciones.
3. Ejecutar `dql/consultas.sql` para correr las consultas que
   atraviesan la tabla puente.
