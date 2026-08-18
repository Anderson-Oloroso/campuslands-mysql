# Ejercicio 025 - backup logico para laboratorio de formulas quimicas

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.
4. Generar el backup lógico con `mysqldump`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se creó la tabla `formulas_quimicas`.
- Se aplicaron `PRIMARY KEY`, `UNIQUE`, `NOT NULL`, `ENUM` y `CHECK`.
- Se insertaron 10 registros.
- Se utilizaron `COUNT`, `SUM`, `GROUP BY` y `ORDER BY` para validar los datos.
- Se utilizó `mysqldump` para generar el backup lógico y se comprobó su restauración.

## Estructura 
avanzado/ejercicio-025/
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