# Ejercicio 052 - Vistas avanzadas para animacion 3D

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se crearon las tablas `artistas`, `proyectos_3d` y `proyectos_artistas`.
- Se utilizaron restricciones para validar datos y claves foráneas para las relaciones.
- Se insertaron 5 artistas, 8 proyectos y 13 participaciones.
- Se crearon las vistas `vista_resumen_proyectos` y `vista_carga_artistas` para centralizar reportes con agregaciones y relaciones.

## Estructura 
avanzado/ejercicio-052/
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

        