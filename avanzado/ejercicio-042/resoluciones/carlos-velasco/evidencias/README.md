# Ejercicio 042 - Window Functions para playlist musical

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se creó la tabla `canciones_playlist`.
- Se utilizaron restricciones `CHECK` para duración y reproducciones.
- Se insertaron 12 canciones de diferentes artistas y géneros.
- Se implementaron rankings, promedios, acumulados y comparaciones mediante Window Functions.
- Se utilizaron `RANK`, `ROW_NUMBER`, `AVG OVER`, `SUM OVER` y `LAG`.