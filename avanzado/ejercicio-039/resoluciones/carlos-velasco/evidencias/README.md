# Ejercicio 039 - bloqueos para kickboxing

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se crearon las tablas `peleadores` y `combates` utilizando InnoDB.
- Se utilizaron claves primarias, claves foráneas y restricciones de validación.
- Se insertaron 18 registros entre peleadores y combates.
- Se utilizaron transacciones, `FOR UPDATE` y `FOR SHARE` para demostrar bloqueos.
- Se incluyeron consultas de verificación y una actualización protegida mediante transacción.