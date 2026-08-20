# Ejercicio 054 - DELETE controlado para soldadura

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se creó la tabla `trabajos_soldadura`.
- Se aplicaron restricciones para horas, costo y estado.
- Se insertaron 10 registros.
- Se utilizaron filtros, agregaciones y ordenamientos.
- Se aplicó un `DELETE` controlado mediante el estado `cancelado`.

## Estructura 
basico/ejercicio-054/
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