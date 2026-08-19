# Evidencias - Ejercicio 060

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se creó la tabla `equipos_streaming`.
- Se aplicaron restricciones para precio y stock.
- Se insertaron 10 registros.
- Se crearon índices para estado, categoría, stock, precio y estado-categoría.
- Se utilizaron filtros, ordenamientos, agrupaciones, agregaciones y `EXPLAIN`.
- Se priorizó un índice compuesto para consultas que filtran por estado y categoría.

## Evidencias

Guardar evidencias de:

- Creación de la tabla.
- Creación de los índices.
- Inserción de los 10 registros.
- Resultados de las consultas.
- Resultados de `EXPLAIN`.


## Estructura 
avanzado/ejercicio-060/
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