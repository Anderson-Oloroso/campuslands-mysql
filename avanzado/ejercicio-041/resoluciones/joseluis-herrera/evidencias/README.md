# Ejercicio 041 - CTE para pingpong

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se creó la tabla `jugadores`.
- Se aplicaron `NOT NULL`, `CHECK`, `ENUM` y `UNIQUE`.
- Se insertaron 8 jugadores.
- Se utilizaron CTE mediante `WITH`, además de filtros, agrupaciones, cálculos, ordenamientos y `LIMIT`.

## Estructura 
avanzado/ejercicio-041/
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