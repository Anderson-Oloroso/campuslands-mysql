# Ejercicio 029 - Vistas simples para marketplace de accesorios

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se creó la tabla `accesorios` con 10 registros.
- Se utilizaron `PRIMARY KEY`, `NOT NULL`, `ENUM` y `CHECK`.
- Se creó la vista `vista_accesorios_disponibles` para mostrar accesorios activos con stock.
- Se incluyeron 6 consultas con filtros, ordenamientos, agregaciones y validación de la vista.