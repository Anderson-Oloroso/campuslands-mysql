# Ejercicio 014 - Vistas simples para saga de ciencia ficción

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se creó la tabla `peliculas`.
- Se crearon las vistas `vista_peliculas_activas` y `vista_top_peliculas`.
- Se aplicaron `PRIMARY KEY`, `ENUM` y validación del puntaje.
- Se insertaron 10 registros.
- Se utilizaron vistas, filtros, `GROUP BY`, `AVG`, ordenamientos y `LIMIT`.

## Estructura 
intermedio/ejercicio-014/
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