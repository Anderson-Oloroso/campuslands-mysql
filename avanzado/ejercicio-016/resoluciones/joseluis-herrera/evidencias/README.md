# Ejercicio 016 - Transacciones para restaurante de comida urbana

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se crearon las tablas `clientes`, `platos`, `inventario`, `pedidos` y `detalle_pedido`.
- Se utilizaron claves primarias, claves foráneas, `NOT NULL`, `UNIQUE` y `CHECK`.
- Se cargaron 13 registros iniciales entre clientes, platos e inventario.
- Se utilizaron `START TRANSACTION`, `COMMIT` y `ROLLBACK`.
- Las consultas utilizan `JOIN`, filtros, agregaciones, ordenamientos y cálculos.

## Ruta 
avanzado/ejercicio-016/
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