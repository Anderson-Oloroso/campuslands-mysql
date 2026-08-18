# Ejercicio 017 - Procedimientos almacenados para tienda de ropa

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se crearon las tablas `categorias` y `productos`.
- Se utilizaron claves primarias, clave foránea, `UNIQUE`, `NOT NULL` y `CHECK`.
- Se insertaron 6 categorías y 10 productos.
- Se crearon 5 procedimientos almacenados para consultar, filtrar, actualizar stock y obtener indicadores.
- Se utilizó `SIGNAL` para validar que el stock no sea negativo.

## Estructura 
avanzado/ejercicio-017/
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