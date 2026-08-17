# Ejercicio 018 - GROUP BY para viajes y turismo

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se creó la tabla `viajes`.
- Se aplicaron `PRIMARY KEY`, `NOT NULL`, `ENUM` y restricciones `CHECK`.
- Se insertaron 12 registros coherentes con diferentes países, categorías y temporadas.
- Las consultas utilizan `GROUP BY`, agregaciones, `HAVING`, filtros y ordenamientos.
- Se realizaron agrupaciones por categoría, país, temporada, estado y combinaciones de columnas.