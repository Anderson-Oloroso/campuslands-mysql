# Ejercicio 024 - bloqueos para soldadura

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.
4. Ejecutar las pruebas de bloqueo utilizando dos conexiones MySQL.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se creó la tabla `trabajos_soldadura` utilizando el motor InnoDB.
- Se aplicaron `PRIMARY KEY`, `NOT NULL`, `ENUM` y `CHECK`.
- Se insertaron 10 registros.
- Se utilizaron transacciones, `FOR UPDATE`, `LOCK IN SHARE MODE`, `COMMIT` y `ROLLBACK` para demostrar bloqueos.

## Estructura 
avanzado/ejercicio-024/
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