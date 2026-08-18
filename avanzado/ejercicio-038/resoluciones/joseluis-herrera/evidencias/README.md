# Ejercicio 038 - Roles y permisos para futbol sala

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

* Se utilizó la base de datos `campuslands_mysql`.
* Se creó la tabla `jugadores` con restricciones `CHECK`, `ENUM`, `NOT NULL` y `UNIQUE`.
* Se insertaron 8 jugadores con diferentes posiciones, estados y cantidades de goles.
* Se crearon los roles `rol_futbol_lectura` y `rol_futbol_operador`.
* Se asignaron permisos de `SELECT` al rol de lectura y `SELECT`, `INSERT` y `UPDATE` al rol operador.
* Se utilizaron filtros, agrupaciones, agregaciones, ordenamiento, `LIMIT` y `SHOW GRANTS`.


## Estructura 
avanzado/ejercicio-038/
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