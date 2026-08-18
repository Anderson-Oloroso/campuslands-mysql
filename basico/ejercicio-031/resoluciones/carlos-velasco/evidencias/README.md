# Ejercicio 031 - CREATE TABLE para torneo esports MOBA

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se creó la tabla `jugadores_moba` con 12 registros.
- Se utilizaron `PRIMARY KEY`, `NOT NULL`, `ENUM` y restricciones `CHECK`.
- Se almacenaron victorias y derrotas como valores enteros no negativos.
- Se incluyeron 6 consultas con filtros, ordenamientos, agrupaciones y cálculos.