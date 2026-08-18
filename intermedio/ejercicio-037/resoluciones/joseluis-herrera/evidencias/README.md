# Ejercicio 037 - Vistas avanzadas para liga de futbol

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se crearon las tablas `ligas`, `equipos` y `participaciones`.
- Se aplicaron claves primarias, foráneas, restricciones `UNIQUE` y `CHECK`.
- Se insertaron 1 liga, 10 equipos y 10 participaciones.
- Se crearon las vistas `vista_tabla_posiciones` y `vista_rendimiento_equipos`.
- Se utilizaron `JOIN`, cálculos, `ROUND`, `NULLIF`, `WHERE`, `ORDER BY` y `LIMIT`.


## Estructura 
avanzado/ejercicio-037/
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
            