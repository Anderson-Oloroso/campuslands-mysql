# Ejercicio 024 - Bloqueos para soldadura

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.
4. Para comprobar bloqueos reales, utilizar dos sesiones MySQL simultáneas.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se crearon las tablas `soldadores` y `trabajos_soldadura`.
- Se utilizó InnoDB para soportar bloqueos transaccionales.
- Se aplicaron claves foráneas, `CHECK`, `NOT NULL` y `ENUM`.
- Se cargaron 10 soldadores y 12 trabajos.
- Se incluyeron 10 consultas, incluyendo `FOR UPDATE`, `FOR SHARE` y transacciones.
- La prueba principal demuestra el bloqueo de una fila entre dos sesiones.