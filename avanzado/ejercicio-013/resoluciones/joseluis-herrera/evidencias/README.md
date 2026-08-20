# Ejercicio 013 - JSON en MySQL para catálogo de películas de miedo

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se creó la tabla `peliculas` con un campo JSON para información variable.
- Se aplicaron clave primaria, ENUM y validaciones para puntaje y JSON.
- Se insertaron 10 registros con información JSON coherente.
- Se utilizaron `JSON_EXTRACT`, `JSON_UNQUOTE`, `JSON_LENGTH` y `JSON_CONTAINS`.
- Las consultas incluyen filtros, ordenamientos y un Top 5.

avanzado/ejercicio-013/
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