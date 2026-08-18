# Ejercicio 051 - EXPLAIN para dibujo digital

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se creó la tabla `ilustraciones` con 12 registros.
- Se utilizaron restricciones `CHECK`, `NOT NULL` y `ENUM`.
- Se creó el índice compuesto `idx_ilustraciones_tecnica_estado`.
- Se incluyeron consultas de filtros, ordenamientos, agregaciones y `LIMIT`.
- Se utilizaron consultas `EXPLAIN` para analizar el plan de ejecución de consultas filtradas por técnica y estado.

## Evidencias

Guardar resultados que demuestren:

- Creación correcta de la tabla.
- Inserción de los 12 registros.
- Resultados de las consultas principales.
- Resultado de los `EXPLAIN`, especialmente las consultas que utilizan `tecnica` y `estado`.