# Ejercicio 053 - Normalizacion 3FN para arquitectura 3D

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se crearon las tablas `arquitectos`, `tipos_proyecto`, `estados_proyecto` y `proyectos`.
- Se separaron tipos y estados para evitar dependencias transitivas y repetición de datos.
- Se insertaron 5 arquitectos, 5 tipos, 4 estados y 10 proyectos.
- Se utilizaron claves foráneas, `JOIN`, `GROUP BY`, agregaciones, filtros y ordenamientos.

## Estructura 
intermedio/ejercicio-053/
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