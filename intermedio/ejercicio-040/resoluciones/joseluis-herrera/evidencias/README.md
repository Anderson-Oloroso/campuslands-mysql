# Ejercicio 040 - UNIQUE para carreras urbanas

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

* Se utilizó la base de datos `campuslands_mysql`.
* Se creó la tabla `participantes`.
* Se aplicó `UNIQUE` al campo `codigo_inscripcion` para evitar códigos duplicados.
* Se aplicaron restricciones `NOT NULL`, `CHECK` y `ENUM`.
* Se insertaron 8 participantes con códigos únicos.
* Se utilizaron filtros, `COUNT`, `SUM`, `AVG`, `GROUP BY`, `ORDER BY` y `LIMIT`.


## Estructura 
intermedio/ejercicio-040/
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