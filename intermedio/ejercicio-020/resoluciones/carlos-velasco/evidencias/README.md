# Ejercicio 020 - Subconsultas para estudio de tatuajes

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se creó la tabla `tatuajes`.
- Se aplicaron `PRIMARY KEY`, `AUTO_INCREMENT`, `NOT NULL`, `ENUM` y restricciones `CHECK`.
- Se insertaron 12 registros con diferentes artistas, estilos, precios, duraciones y estados.
- Las consultas utilizan subconsultas escalares, subconsultas correlacionadas, `IN` y `ALL`.
- Se realizaron comparaciones contra promedios, máximos, mínimos y valores agrupados por estilo.