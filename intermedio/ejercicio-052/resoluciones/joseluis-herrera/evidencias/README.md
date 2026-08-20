# Ejercicio 052 - Normalizacion 2FN para animacion 3D

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se crearon las tablas `artistas`, `proyectos_3d` y `proyectos_artistas`.
- La tabla puente utiliza una clave primaria compuesta y claves foráneas para representar la relación.
- Se insertaron 5 artistas, 8 proyectos y 13 participaciones.
- Se utilizaron `JOIN`, `GROUP BY`, agregaciones, filtros, ordenamientos y `LIMIT`.

## Estructura 
intermedio/ejercicio-052/
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