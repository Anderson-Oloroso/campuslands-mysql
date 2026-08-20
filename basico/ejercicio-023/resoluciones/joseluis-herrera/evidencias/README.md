# Ejercicio 023 - UPDATE para arquitectura 3D

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

* Se utilizó la base de datos `campuslands_mysql`.
* Se creó la tabla `proyectos_arquitectura`.
* Se utilizaron `PRIMARY KEY`, `NOT NULL`, `ENUM` y `CHECK`.
* Se insertaron 10 registros.
* Se utilizaron `UPDATE` con `WHERE`, operaciones sobre valores existentes y consultas de verificación con `SELECT`.
* También se utilizaron `GROUP BY`, `COUNT`, `AVG` y `ORDER BY`.

## Estructura 
basico/ejercicio-023/
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