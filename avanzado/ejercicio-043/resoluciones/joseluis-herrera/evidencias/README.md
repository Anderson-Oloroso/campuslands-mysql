# Evidencias - Ejercicio 043

## Evidencias requeridas

- Ejecución correcta de `ddl/schema.sql` y creación de `campuslands_mysql.peliculas_miedo`.
- Inserción correcta de los 8 registros mediante `dml/inserts.sql`.
- Resultado de las 5 consultas de `dql/consultas.sql`.
- Evidencia de extracción y filtrado de información almacenada en JSON.
- Evidencia del ranking de películas y del reporte agrupado por subgénero.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se creó la tabla `peliculas_miedo`.
- Se utilizó un campo `JSON` para información variable de cada película.
- Se aplicaron restricciones para validar la puntuación y la estructura JSON.
- Se insertaron 8 registros.
- Se utilizaron funciones JSON, filtros, agregaciones, GROUP BY, ORDER BY y LIMIT.

## Estructura
avanzado/ejercicio-043/
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