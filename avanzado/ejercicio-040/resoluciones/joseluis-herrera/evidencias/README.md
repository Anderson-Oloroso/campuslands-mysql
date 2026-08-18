# Ejercicio 040 - Backup logico para carreras urbanas

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.
4. Generar el backup lógico con `mysqldump`.

## Decisiones técnicas

* Se utilizó la base de datos `campuslands_mysql`.
* Se creó la tabla `participantes` con `UNIQUE`, `CHECK`, `NOT NULL` y `ENUM`.
* Se insertaron 8 registros.
* Se utilizaron `COUNT`, `SUM`, `AVG`, `MIN`, `MAX`, `GROUP BY`, `ORDER BY` y `LIMIT`.
* El respaldo lógico se realiza con `mysqldump`.


## Estructura 
avanzado/ejercicio-040/
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