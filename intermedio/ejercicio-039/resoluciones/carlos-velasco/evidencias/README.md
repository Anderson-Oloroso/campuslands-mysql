# Ejercicio 039 - FOREIGN KEY para kickboxing

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se crearon las tablas `entrenadores` y `peleadores`.
- `peleadores.id_entrenador` referencia `entrenadores.id_entrenador` mediante `FOREIGN KEY`.
- Se utilizaron `PRIMARY KEY`, `CHECK`, `ENUM` y `ON DELETE RESTRICT`.
- Se insertaron 5 entrenadores y 10 peleadores.
- Se utilizaron `INNER JOIN`, `LEFT JOIN`, `GROUP BY`, `HAVING`, `WHERE` y `ORDER BY`.