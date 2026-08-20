# Ejercicio 045 - optimizacion para biblioteca gamer

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se crearon las tablas `categorias` y `videojuegos`.
- Se utilizaron claves primarias, clave foránea, `NOT NULL`, `UNIQUE` y `CHECK`.
- Se insertaron 4 categorías y 10 videojuegos.
- Se agregaron índices para `estado`, `plataforma`, `id_categoria`, `estado + id_categoria` y `precio`.
- Se utilizaron `EXPLAIN`, `JOIN`, subconsultas, agregaciones, ordenamientos y funciones de ventana.