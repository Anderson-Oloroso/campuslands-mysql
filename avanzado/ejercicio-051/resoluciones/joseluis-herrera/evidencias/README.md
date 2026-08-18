# Ejercicio 051 - EXPLAIN para dibujo digital

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se creó la tabla `dibujos` con restricciones para precio, nivel y estado.
- Se insertaron 10 registros con datos variados.
- Se crearon índices sobre `estado, precio` y `artista, estado`.
- Se utilizaron consultas de filtros, agregaciones, ordenamientos y `EXPLAIN` para analizar los planes de ejecución.

## Estructura 
avanzado/ejercicio-051/
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