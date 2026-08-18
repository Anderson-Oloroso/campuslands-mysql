# Ejercicio 020 - Índices para estudio de tatuajes

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se creó la tabla `tatuajes`.
- Se utilizó `PRIMARY KEY` para identificar cada tatuaje.
- Se aplicó `CHECK` para impedir precios menores o iguales a cero.
- Se utilizaron índices para `nombre_tatuador`, `estilo`, `estado` y `fecha_cita`.
- Se insertaron 10 registros coherentes.
- Se utilizaron consultas de filtros, agrupaciones, subconsulta y `EXPLAIN` para comprobar los índices.

## Estructura 
avanzado/ejercicio-020/
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