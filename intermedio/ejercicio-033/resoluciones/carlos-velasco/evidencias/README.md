# Ejercicio 033 - GROUP BY para inventario de skins shooter

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se creó la tabla `skins`.
- Se aplicaron `PRIMARY KEY`, `NOT NULL`, `UNIQUE`, `ENUM` y `CHECK`.
- Se insertaron 12 registros.
- Se utilizaron `GROUP BY`, `COUNT`, `SUM`, `AVG`, `MIN`, `MAX`, `ROUND` y `ORDER BY`.
- Los datos permiten agrupar por arma, rareza y estado.