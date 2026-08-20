# Ejercicio 034 - triggers para garaje de motos

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se crearon las tablas `motos`, `mantenimientos` y `auditoria_mantenimientos`.
- Se aplicaron restricciones para cilindrada, kilometraje y costos.
- Se insertaron 8 motos y 8 mantenimientos.
- Se implementó un trigger para registrar automáticamente los mantenimientos en la tabla de auditoría.
- Se incluyeron consultas con `JOIN`, agregaciones, filtros y subconsulta.