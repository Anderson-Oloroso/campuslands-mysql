# Ejercicio 025 - UNIQUE para laboratorio de formulas quimicas

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se creó la tabla `formulas_quimicas`.
- `codigo_formula` utiliza `UNIQUE` para evitar códigos duplicados.
- Se aplicaron `PRIMARY KEY`, `AUTO_INCREMENT`, `NOT NULL`, `ENUM` y `CHECK`.
- Se insertaron 10 fórmulas con códigos únicos.
- Las consultas utilizan filtros, ordenamientos, cálculos y `LIMIT`.