# Ejercicio 042 - Window functions para playlist musical

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se creó la tabla `playlists` con `PRIMARY KEY`, `UNIQUE`, `NOT NULL` y `CHECK`.
- Se insertaron 10 playlists.
- Se utilizaron `ROW_NUMBER`, `RANK`, `DENSE_RANK`, `AVG OVER`, `SUM OVER` y `LAG`.
- Las funciones de ventana permiten generar rankings, acumulados y comparaciones por género.

## Estructura 
avanzado/ejercicio-042/
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