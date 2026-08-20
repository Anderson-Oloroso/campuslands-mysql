# Ejercicio 042 - Modelado de entidad para playlist musical

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se creó la entidad `playlists` con atributos propios de una playlist musical.
- Se aplicaron `NOT NULL`, `CHECK`, `ENUM`, `PRIMARY KEY` y `UNIQUE`.
- Se insertaron 8 playlists.
- Se utilizaron filtros, ordenamientos, `COUNT`, `SUM`, `AVG`, `GROUP BY` y `LIMIT`.


## Estructura 
basico/ejercicio-042/
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