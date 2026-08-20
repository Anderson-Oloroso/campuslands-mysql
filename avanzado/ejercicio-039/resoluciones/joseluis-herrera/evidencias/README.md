# Ejercicio 039 - Bloqueos para kickboxing

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

* Se utilizó la base de datos `campuslands_mysql`.
* Se creó la tabla `peleadores` utilizando el motor transaccional InnoDB.
* Se aplicaron restricciones `NOT NULL`, `CHECK` y `ENUM`.
* Se insertaron 8 registros.
* Se utilizaron filtros, agregaciones, agrupaciones, ordenamientos y `LIMIT`.
* Se utilizaron transacciones y `SELECT ... FOR UPDATE` para demostrar bloqueos de filas.

## Estrcutura 
avanzado/ejercicio-039/
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