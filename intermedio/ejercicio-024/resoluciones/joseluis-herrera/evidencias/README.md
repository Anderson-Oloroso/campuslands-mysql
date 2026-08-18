# Ejercicio 024 - FOREIGN KEY para soldadura

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se crearon `clientes`, `soldadores` y `trabajos_soldadura`.
- Se utilizaron `FOREIGN KEY` para relacionar trabajos con clientes y soldadores.
- Se aplicaron `PRIMARY KEY`, `UNIQUE`, `NOT NULL`, `ENUM` y `CHECK`.
- Se insertaron 4 clientes, 4 soldadores y 10 trabajos.
- Se utilizaron `JOIN`, `WHERE`, `GROUP BY`, `COUNT`, `SUM`, `AVG`, `ORDER BY` y `LIMIT`.

## Estructura 
intermedio/ejercicio-024/
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