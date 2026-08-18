# Ejercicio 053 - UPDATE para arquitectura 3D

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se creó la tabla `proyectos_arquitectura` con restricciones para área, presupuesto y estado.
- Se insertaron 10 registros.
- Se utilizaron `UPDATE` con condiciones mediante `WHERE` para modificar estados y presupuestos.
- Se incluyeron consultas de verificación antes y después de las modificaciones.

## Estructura 
basico/ejercicio-053/
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