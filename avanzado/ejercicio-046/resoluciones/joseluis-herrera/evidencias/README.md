# Ejercicio 046 - Transacciones para restaurante de comida urbana

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se crearon las tablas `productos`, `pedidos` y `detalle_pedidos`.
- Se utilizaron claves primarias, claves foráneas, `CHECK`, `NOT NULL` y `ENUM`.
- Se cargaron 10 productos y 2 pedidos iniciales.
- Se utilizó una transacción para registrar un pedido y actualizar el stock de forma atómica.
- Se utilizaron `START TRANSACTION`, `COMMIT`, `JOIN`, agregaciones, filtros y ordenamientos.

## Estructura 
avanzado/ejercicio-046/
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