# Ejercicio 033 - funciones SQL para inventario de skins shooter

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se creó la tabla `inventario_skins` con restricciones para precio y cantidad.
- Se insertaron 10 registros de skins.
- Se implementaron las funciones `fn_calcular_valor_inventario` y `fn_clasificar_raridad`.
- Se incluyeron consultas con funciones, filtros, agregaciones, ordenamiento y ranking.

## estructura

avanzado/ejercicio-033/
└── resoluciones/
    └── carlos-velasco/
        ├── ddl/
        │   └── schema.sql
        ├── dml/
        │   └── inserts.sql
        ├── dql/
        │   └── consultas.sql
        └── evidencias/
            └── README.md