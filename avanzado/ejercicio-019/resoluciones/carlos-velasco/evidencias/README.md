# Ejercicio 019 - HAVING para paracaidismo

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se creó la tabla `saltos`.
- Se aplicaron `PRIMARY KEY`, `AUTO_INCREMENT`, `NOT NULL`, `ENUM` y restricciones `CHECK`.
- Se insertaron 12 registros con diferentes modalidades y niveles.
- Las consultas utilizan `GROUP BY`, `HAVING`, `COUNT`, `SUM`, `AVG`, filtros y ordenamientos.
- `HAVING` se utiliza para filtrar resultados obtenidos mediante funciones de agregación.