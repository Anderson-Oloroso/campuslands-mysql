# Ejercicio 015 - Optimización para biblioteca gamer

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se creó la tabla `videojuegos`.
- Se aplicaron `PRIMARY KEY`, `ENUM` y validaciones para precio y puntaje.
- Se cargaron 12 registros.
- Se agregaron índices para estado, plataforma, fecha de lanzamiento y puntaje.
- Se utilizaron filtros, agrupaciones, ordenamientos, `LIMIT`, `EXPLAIN` y `SHOW INDEX`.

## indices
idx_videojuegos_estado
idx_videojuegos_plataforma
idx_videojuegos_fecha
idx_videojuegos_puntaje

## estructura 
avanzado/ejercicio-015/
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