# Ejercicio 020 - Indices para estudio de tatuajes

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se crearon las tablas `tatuadores`, `clientes` y `citas`.
- Se utilizaron claves foráneas, `CHECK`, `ENUM`, `NOT NULL` y `UNIQUE`.
- Se cargaron 10 tatuadores, 10 clientes y 12 citas.
- Se crearon índices para estados, especialidades, fechas y relaciones de búsqueda frecuente.
- Se utilizaron índices compuestos para consultas por tatuador/fecha y cliente/estado.
- Se incluyeron 8 consultas de negocio y pruebas `EXPLAIN` para comprobar los índices.