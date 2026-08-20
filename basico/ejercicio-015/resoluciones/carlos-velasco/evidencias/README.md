# Ejercicio 015 - Relaciones simples

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se modeló una relación simple entre las tablas `categorias` y `videojuegos`.
- La tabla `videojuegos` contiene una llave foránea (`categoria_id`) que referencia a `categorias`.
- Se aplicaron restricciones `PRIMARY KEY`, `FOREIGN KEY`, `NOT NULL`, `UNIQUE` y `ENUM`.
- Se insertaron cuatro categorías y ocho videojuegos con datos realistas.
- Se agregaron consultas utilizando `INNER JOIN` para demostrar la relación entre ambas tablas.