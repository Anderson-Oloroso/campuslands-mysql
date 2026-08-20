# Ejercicio 035 - Indices para taller mecanico de motos

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se creó la tabla `servicios_taller` con restricciones para estado, tipo de servicio, costo y registros únicos por placa y fecha.
- Se insertaron 12 registros.
- Se crearon índices para placa, estado, fecha y estado-fecha.
- Se utilizaron filtros, ordenamientos, agregaciones, ranking y `EXPLAIN`.
- Las consultas con `EXPLAIN` permiten comprobar el uso de los índices.

## Estructura 
avanzado/ejercicio-035/
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