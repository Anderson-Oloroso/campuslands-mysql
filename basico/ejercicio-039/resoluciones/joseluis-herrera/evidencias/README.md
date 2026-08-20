# Ejercicio 039 - DELETE controlado para kickboxing

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

* Se utilizó la base de datos `campuslands_mysql`.
* Se creó la tabla `peleadores` con restricciones `NOT NULL`, `CHECK` y `ENUM`.
* Se insertaron 8 registros con diferentes categorías y estados.
* Se utilizaron filtros, agrupaciones, ordenamientos y agregaciones.
* Se realizó un `DELETE` controlado mediante `id_peleador` y `estado`.


basico/ejercicio-039/
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