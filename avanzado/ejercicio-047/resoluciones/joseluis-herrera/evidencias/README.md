# Ejercicio 047 - Procedimientos almacenados para tienda de ropa

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se crearon las tablas `categorias` y `prendas`.
- Se implementaron 3 procedimientos almacenados para registrar prendas, actualizar stock y consultar por categoría.
- Se insertaron 5 categorías y 10 prendas.
- Se utilizaron `INNER JOIN`, `LEFT JOIN`, agregaciones y procedimientos `CALL`.

## Estructura 
avanzado/ejercicio-047/
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