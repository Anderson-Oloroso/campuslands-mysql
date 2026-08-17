# Ejercicio 014 - Fechas básicas para saga de ciencia ficción

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se creó la tabla `peliculas` con fechas de estreno mediante `DATE`.
- Se aplicaron `PRIMARY KEY`, `ENUM` y validación del puntaje.
- Se insertaron 10 registros de diferentes sagas.
- Se utilizaron filtros por fecha, `BETWEEN`, `GROUP BY`, ordenamientos y `LIMIT`.

## Estructura 
basico/ejercicio-014/
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