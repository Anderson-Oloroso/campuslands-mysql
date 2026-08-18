# Ejercicio 028 - Filtros por estado para academia tech

## Ejecución

Ejecutar los archivos en este orden:

1. `ddl/schema.sql`
2. `dml/inserts.sql`
3. `dql/consultas.sql`

## Decisiones técnicas

- Se creó la tabla `estudiantes`.
- Se utilizó `ENUM` para controlar los estados `activo` e `inactivo`.
- Se agregó una restricción `CHECK` para validar el promedio entre 0 y 100.
- Se utilizaron 10 registros para probar diferentes estados, cursos y niveles.
- Las consultas utilizan filtros por estado, conteos, promedios y ordenamientos.

## Estructura
basico/ejercicio-028/
└── resoluciones/
    └── joseluis-herrera/
        ├── README.md
        ├── ddl/
        │   └── schema.sql
        ├── dml/
        │   └── inserts.sql
        ├── dql/
        │   └── consultas.sql
        └── evidencias/
            └── README.md