# Ejercicio 054 - bloqueos para soldadura

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se creó la tabla `trabajos_soldadura` con motor `InnoDB`.
- Se aplicaron restricciones para horas, costo y estado.
- Se insertaron 10 registros.
- Se utilizaron transacciones, `SELECT ... FOR UPDATE`, `UPDATE`, `COMMIT` y `ROLLBACK`.
- Se incluyeron consultas de filtros, ordenamientos y agregaciones.

## Estructura 
avanzado/ejercicio-054/
└── resoluciones/
    └── joseluis-herrera/
        ├── ddl/
        │   └── schema.sql
        ├── dml/
        │   └── inserts.sql
        ├── dql/
        │   └── consultas.sql
        └── evidencias/
            └── README.md