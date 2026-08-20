# Ejercicio 017 - LEFT JOIN para tienda de ropa

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se crearon las tablas `productos`, `clientes`, `ventas` y `detalle_venta`.
- Se utilizaron claves primarias, claves foráneas, `NOT NULL` y `CHECK`.
- Se insertaron 10 productos, 5 clientes, 6 ventas y 10 detalles.
- Se utilizó `LEFT JOIN` para conservar productos y clientes aunque no tengan registros relacionados.
- Se utilizaron `COALESCE`, `SUM`, `COUNT`, `GROUP BY`, filtros y ordenamientos.

## Estructura 
intermedio/ejercicio-017/
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
