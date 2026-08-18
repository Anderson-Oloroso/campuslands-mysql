# Ejercicio 025 - Backup lógico para laboratorio de fórmulas químicas

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.
4. Generar el backup con `mysqldump` desde la terminal.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se crearon las tablas `responsables`, `sustancias`, `formulas_laboratorio` y `formula_sustancias`.
- Se utilizaron claves foráneas, `UNIQUE`, `CHECK`, `NOT NULL` y `ENUM`.
- Se cargaron 8 responsables, 10 sustancias, 10 fórmulas y 25 relaciones entre fórmulas y sustancias.
- Se incluyeron 8 consultas para validar filtros, relaciones, agregaciones y datos del respaldo.
- El backup lógico se realiza mediante `mysqldump`.