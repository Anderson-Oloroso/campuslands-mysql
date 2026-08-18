# Ejercicio 025 - COUNT y SUM para laboratorio de formulas quimicas

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se creó la tabla `formulas_quimicas`.
- Se aplicaron `PRIMARY KEY`, `NOT NULL`, `ENUM` y restricciones `CHECK`.
- Se insertaron 10 registros.
- Se utilizaron `COUNT`, `SUM`, `WHERE`, `GROUP BY` y `ORDER BY`.
- Se calcularon totales de formulas, muestras y costos.

## Estructura 
basico/ejercicio-025/
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