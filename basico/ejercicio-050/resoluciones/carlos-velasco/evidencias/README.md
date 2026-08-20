# Ejercicio 050 - SELECT para estudio de tatuajes

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se creó la tabla `tatuajes` con información de clientes, artistas, estilos, tamaños, precios, estados y fechas.
- Se utilizaron `PRIMARY KEY`, `NOT NULL`, `ENUM` y restricciones `CHECK` para validar los datos.
- Se insertaron 10 registros.
- Se utilizaron consultas `SELECT` con filtros, `IN`, `ORDER BY`, `LIMIT` y funciones de agregación.