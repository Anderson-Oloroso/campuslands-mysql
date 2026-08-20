# Ejercicio 055 - UNIQUE para laboratorio de formulas quimicas

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se creó la tabla `formulas_quimicas`.
- Se aplicó `UNIQUE` sobre `codigo_formula`.
- Se agregaron restricciones para cantidades y estado.
- Se insertaron 10 registros con códigos únicos.
- Se utilizaron filtros, ordenamientos, `GROUP BY`, `COUNT` y `SUM`.

## Estructura 
intermedio/ejercicio-055/
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