# Evidencias - Ejercicio 044

## Evidencias requeridas

- Ejecución correcta de `ddl/schema.sql`.
- Inserción de los 8 registros mediante `dml/inserts.sql`.
- Resultado de las 5 consultas de `dql/consultas.sql`.
- Evidencia de filtros y ordenamientos utilizando fechas.
- Evidencia de agrupación por año y cálculo con `DATEDIFF()`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se creó la tabla `peliculas_ciencia_ficcion`.
- Se utilizó `DATE` para almacenar las fechas de estreno.
- Se aplicaron restricciones para validar duración y puntuación.
- Se insertaron 8 registros.
- Se utilizaron `YEAR()`, `DATEDIFF()`, filtros, ordenamientos, `GROUP BY` y `COUNT()`.

## Estructura 
basico/ejercicio-044/
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