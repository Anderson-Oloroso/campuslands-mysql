# Ejercicio 045 - relaciones simples para biblioteca gamer

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se crearon las tablas `categorias` y `videojuegos` mediante una relación 1:N.
- Se utilizó una clave foránea para relacionar cada videojuego con su categoría.
- Se agregaron restricciones `NOT NULL`, `UNIQUE`, `CHECK` y `FOREIGN KEY`.
- Se insertaron 4 categorías y 8 videojuegos.
- Se utilizaron consultas con `JOIN`, filtros, ordenamientos, `COUNT`, `AVG` y `GROUP BY`.