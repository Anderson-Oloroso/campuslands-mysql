# Ejercicio 040 - backup logico para carreras urbanas

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.
4. Generar el backup lógico con `mysqldump`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se crearon las tablas `carreras`, `corredores` y `participaciones`.
- Se utilizaron claves primarias, claves foráneas, `UNIQUE` y restricciones `CHECK`.
- Se insertaron 18 registros.
- Se utilizaron consultas con `COUNT`, `SUM`, `JOIN`, `GROUP BY` y filtros.
- El backup lógico se genera mediante `mysqldump` y se valida antes de su restauración.