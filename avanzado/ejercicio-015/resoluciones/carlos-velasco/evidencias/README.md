# Ejercicio 015 - Optimizacion para biblioteca gamer

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se creó la tabla `videojuegos` con restricciones `UNIQUE` y `CHECK`.
- Se insertaron 12 registros con diferentes géneros, plataformas, precios, puntuaciones y estados.
- Se utilizaron índices simples y compuestos orientados a los filtros y ordenamientos de las consultas.
- Se utilizaron `EXPLAIN` para revisar los planes de ejecución y comprobar el comportamiento del optimizador.