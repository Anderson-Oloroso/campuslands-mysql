# Ejercicio 055 - Backup logico para laboratorio de formulas quimicas

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.
4. Generar el backup lógico con `mysqldump`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se creó la tabla `formulas_quimicas` con restricciones `PRIMARY KEY` y `CHECK`.
- Se insertaron 10 registros coherentes.
- Se utilizaron `COUNT`, `SUM`, `GROUP BY`, `WHERE` y `ORDER BY`.
- El backup lógico se realiza mediante `mysqldump`.

## Estructura 
avanzado/ejercicio-055/
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