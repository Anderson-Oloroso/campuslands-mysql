# Ejercicio 035 - Subconsultas para taller mecanico de motos

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se creó la tabla `servicios_taller` con restricciones para costo y estado.
- Se insertaron 12 registros coherentes.
- Se utilizaron subconsultas con `AVG()`, `MAX()`, `ALL` e `IN`.
- Las consultas permiten comparar costos generales, por marca, estado y tipo de servicio.


## Estructura 
intermedio/ejercicio-035/
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