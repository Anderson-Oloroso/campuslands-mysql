# Ejercicio 013 - Tablas Puente

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se modeló una relación muchos a muchos entre películas y géneros mediante la tabla puente `pelicula_genero`.
- Se utilizaron restricciones `PRIMARY KEY`, `FOREIGN KEY`, `NOT NULL`, `ENUM` y `CHECK`.
- Se insertaron ocho películas, cinco géneros y múltiples relaciones en la tabla puente.
- Las consultas demuestran el uso de `INNER JOIN`, `LEFT JOIN`, `GROUP BY`, `HAVING`, `COUNT` y ordenamientos.