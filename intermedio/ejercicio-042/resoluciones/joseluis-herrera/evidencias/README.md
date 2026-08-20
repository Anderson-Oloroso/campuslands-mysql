# Ejercicio 042 - Consultas de reportes para playlist musical

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se creó la tabla `playlists` con restricciones `NOT NULL`, `CHECK` y `UNIQUE`.
- Se insertaron 8 playlists.
- Se utilizaron consultas de reporte con `COUNT`, `SUM`, `AVG`, `GROUP BY`, `ORDER BY`, filtros y `LIMIT`.
- Los reportes utilizan alias claros para facilitar su lectura.


## Estructura 
intermedio/ejercicio-042/
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