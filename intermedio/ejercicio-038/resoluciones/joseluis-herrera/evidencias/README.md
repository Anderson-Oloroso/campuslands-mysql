# Ejercicio 038 - Normalizacion 3FN para futbol sala

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se crearon las tablas `equipos`, `posiciones` y `jugadores`.
- Se utilizaron claves foráneas para relacionar jugadores con equipos y posiciones.
- Se aplicaron restricciones `UNIQUE` y `CHECK`.
- Se insertaron 4 equipos, 4 posiciones y 10 jugadores.
- Se utilizaron `JOIN`, `WHERE`, `GROUP BY`, `HAVING`, `ORDER BY` y funciones de agregación.

## Estructura 
intermedio/ejercicio-038/
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