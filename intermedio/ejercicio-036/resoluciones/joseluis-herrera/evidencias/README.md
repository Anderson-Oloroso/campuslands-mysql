# Ejercicio 036 - Normalizacion 1FN para autos hiperdeportivos

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se creó la tabla `autos_hiperdeportivos` con atributos atómicos.
- Se aplicaron restricciones para año, potencia, velocidad, precio y estado.
- Se insertaron 10 registros coherentes.
- Se utilizaron consultas con `SELECT`, `WHERE`, `ORDER BY` y `LIMIT`.

## Estructura 
intermedio/ejercicio-036/
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