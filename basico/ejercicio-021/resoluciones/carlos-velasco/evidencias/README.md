# Ejercicio 021 - WHERE para dibujo digital

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se creó la tabla `proyectos_digitales`.
- Se aplicaron `PRIMARY KEY`, `AUTO_INCREMENT`, `NOT NULL`, `ENUM` y restricciones `CHECK`.
- Se insertaron 12 registros con diferentes técnicas, categorías, precios, horas y estados.
- Las consultas utilizan `WHERE`, `IN`, `BETWEEN`, operadores de comparación y condiciones combinadas.