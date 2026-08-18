# Evidencias - Ejercicio 044

## Evidencias requeridas

- Ejecución correcta de `ddl/schema.sql`.
- Creación de la tabla y la vista `vista_peliculas_activas`.
- Inserción de los 8 registros mediante `dml/inserts.sql`.
- Resultado de las 5 consultas de `dql/consultas.sql`.
- Evidencia de que la vista devuelve únicamente películas activas.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se creó la tabla `peliculas_ciencia_ficcion`.
- Se creó la vista `vista_peliculas_activas`.
- Se utilizaron restricciones para validar duración y puntuación.
- Se insertaron 8 registros.
- Se utilizaron filtros, ordenamientos, agregaciones, `COUNT()`, `AVG()` y `LIMIT`.

## Estructura 
intermedio/ejercicio-044/
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