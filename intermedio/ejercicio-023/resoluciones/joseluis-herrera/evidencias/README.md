# Ejercicio 023 - Normalizacion 3FN para arquitectura 3D

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

* Se utilizó la base de datos `campuslands_mysql`.
* Se crearon `clientes`, `arquitectos` y `proyectos_arquitectura`.
* Se separaron los datos de clientes y arquitectos para evitar dependencias transitivas y aplicar 3FN.
* Se utilizaron `PRIMARY KEY`, `FOREIGN KEY`, `UNIQUE`, `NOT NULL`, `ENUM` y `CHECK`.
* Se insertaron 4 clientes, 5 arquitectos y 8 proyectos.
* Se utilizaron `JOIN`, `WHERE`, `GROUP BY`, `COUNT`, `AVG`, `SUM`, `ORDER BY` y `LIMIT`.

## Esturctura 
intermedio/ejercicio-023/
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