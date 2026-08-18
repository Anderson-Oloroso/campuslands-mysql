# Ejercicio 043 - Tablas puente para catálogo de películas de miedo

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se crearon las tablas `peliculas`, `generos` y `pelicula_genero`.
- `pelicula_genero` funciona como tabla puente para representar la relación muchos a muchos.
- Se utilizaron claves primarias, claves foráneas, `UNIQUE`, `NOT NULL` y restricciones `CHECK`.
- Se insertaron 8 películas, 8 géneros y 19 relaciones.
- Se utilizaron `JOIN`, `GROUP_CONCAT`, `COUNT`, `GROUP BY`, `HAVING`, filtros y `ORDER BY`.
- Las consultas permiten comprobar la relación entre películas y múltiples géneros.