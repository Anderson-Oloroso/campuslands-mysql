# Ejercicio 024 - DELETE controlado para soldadura

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se creó la tabla `trabajos_soldadura`.
- Se utilizaron `PRIMARY KEY`, `NOT NULL`, `ENUM` y `CHECK`.
- Se insertaron 10 registros.
- Se utilizó `DELETE` con `WHERE` para eliminar únicamente trabajos cancelados.
- Se utilizaron `SELECT`, `WHERE`, `GROUP BY`, `COUNT` y `ORDER BY` para verificar los resultados.

## EStructura 
basico/ejercicio-024/
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