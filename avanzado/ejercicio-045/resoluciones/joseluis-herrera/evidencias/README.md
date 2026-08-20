# Ejercicio 045 - Optimizacion para biblioteca gamer

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se creó la tabla `videojuegos`.
- Se aplicaron restricciones `NOT NULL`, `CHECK` y `ENUM`.
- Se insertaron 12 registros.
- Se crearon índices para `estado`, `genero`, `puntaje` y `estado + puntaje`.
- Se utilizaron filtros, ordenamientos, agregaciones y `EXPLAIN` para analizar la optimización.

## Estructura 
avanzado/ejercicio-045/
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