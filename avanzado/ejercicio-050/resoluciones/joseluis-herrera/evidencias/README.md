# Ejercicio 050 - Indices para estudio de tatuajes

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se creó la tabla `tatuajes` con validaciones para precio y estado.
- Se insertaron 10 registros con diferentes artistas, estilos, estados y precios.
- Se crearon índices para `estado`, `fecha_tatuaje` y la combinación `nombre_artista, estado`.
- Se utilizaron agregaciones, filtros, ordenamientos, ranking y `EXPLAIN` para verificar el uso de índices.

## Estructura 
avanzado/ejercicio-050/
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