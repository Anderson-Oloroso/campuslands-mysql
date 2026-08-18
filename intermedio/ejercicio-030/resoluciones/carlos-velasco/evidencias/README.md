# Ejercicio 030 - Carga de datos para equipo de streaming

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se creó la tabla `equipos_streaming` con 12 registros.
- Se utilizaron `PRIMARY KEY`, `NOT NULL`, `ENUM` y restricciones `CHECK`.
- Se almacenaron precios con `DECIMAL(10,2)`.
- Se incluyeron 8 consultas con filtros, ordenamientos, agrupaciones y cálculos.