# Ejercicio 048 - funciones SQL para viajes y turismo

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se creó la tabla `viajes` con restricciones para duración, precio y descuento.
- Se insertaron 10 registros de viajes.
- Se creó la función `fn_calcular_precio_final` para calcular precios con descuento.
- Se utilizaron 5 consultas con filtros, ordenamientos, agregaciones y la función almacenada.