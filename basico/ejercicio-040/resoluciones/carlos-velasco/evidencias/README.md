# Ejercicio 040 - COUNT y SUM para carreras urbanas

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se crearon las tablas `carreras`, `corredores` y `participaciones`.
- Se utilizaron claves primarias, claves foráneas, `UNIQUE` y restricciones `CHECK`.
- Se insertaron 18 registros.
- Se utilizaron `COUNT` y `SUM` para obtener cantidades, participantes, kilómetros y recaudación.
- Se incluyeron `JOIN`, `GROUP BY`, filtros y alias para generar reportes.