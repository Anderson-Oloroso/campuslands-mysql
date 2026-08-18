# Ejercicio 043 - Filtros por estado para catalogo de peliculas de miedo

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se creó la tabla `peliculas` con `PRIMARY KEY`, `UNIQUE`, `NOT NULL`, `CHECK` y `ENUM`.
- Se insertaron 10 películas con estados disponibles y no disponibles.
- Se utilizaron filtros por estado, ordenamientos, `COUNT`, `AVG`, `GROUP BY` y `LIMIT`.

## Estructura 
basico/ejercicio-043/
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