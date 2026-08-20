# Ejercicio 021 - EXPLAIN para dibujo digital

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se creó la tabla `ilustraciones`.
- Se aplicó `PRIMARY KEY` y `CHECK` para validar el precio.
- Se crearon índices sobre artista, técnica, categoría, estado y fecha.
- Se insertaron 10 registros coherentes.
- Se utilizaron filtros, agrupaciones y consultas `EXPLAIN` para analizar los planes de ejecución.

## Estructura 
avanzado/ejercicio-021/
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