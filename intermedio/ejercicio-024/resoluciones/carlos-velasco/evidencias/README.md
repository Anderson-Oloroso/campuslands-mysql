# Ejercicio 024 - FOREIGN KEY para soldadura

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se crearon las tablas `soldadores` y `trabajos_soldadura`.
- `trabajos_soldadura.id_soldador` utiliza una `FOREIGN KEY` hacia `soldadores.id_soldador`.
- Se aplicaron `PRIMARY KEY`, `NOT NULL`, `ENUM` y `CHECK`.
- Se insertaron 5 soldadores y 10 trabajos.
- Las consultas utilizan `INNER JOIN`, `LEFT JOIN`, `GROUP BY`, agregaciones, filtros y ordenamientos.