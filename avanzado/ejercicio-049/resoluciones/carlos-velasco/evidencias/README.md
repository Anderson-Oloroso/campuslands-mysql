# Ejercicio 049 - triggers para paracaidismo

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se crearon las tablas `saltos_paracaidismo` y `auditoria_saltos`.
- Se aplicaron restricciones para altura y duración.
- Se insertaron 10 registros.
- Se creó el trigger `tr_registrar_salto` para auditar automáticamente cada inserción.
- Se utilizaron 5 consultas para validar los datos y el funcionamiento del trigger.