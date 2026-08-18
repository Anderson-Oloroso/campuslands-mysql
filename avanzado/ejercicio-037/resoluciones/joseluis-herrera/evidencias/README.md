# Ejercicio 037 - Normalizacion 2FN para liga de futbol

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se separaron las tablas `ligas`, `equipos` y `participaciones` para evitar dependencias parciales.
- Se utilizaron claves primarias, foráneas y una restricción única por participación.
- Se insertaron 1 liga, 10 equipos y 10 participaciones.
- Se utilizaron consultas con `JOIN`, `WHERE`, `ORDER BY` y `LIMIT`.

## Estructura 
intermedio/ejercicio-037/
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