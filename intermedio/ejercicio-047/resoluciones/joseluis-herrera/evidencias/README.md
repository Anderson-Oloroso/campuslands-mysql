# Ejercicio 047 - LEFT JOIN para tienda de ropa

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se crearon las tablas `categorias` y `prendas`.
- Se relacionaron mediante `id_categoria` como clave foránea.
- Se aplicaron `PRIMARY KEY`, `UNIQUE`, `NOT NULL` y `CHECK`.
- Se insertaron 6 categorías y 10 prendas.
- Se utilizó `LEFT JOIN` para conservar categorías sin prendas relacionadas.
- Se utilizaron agrupaciones, filtros, cálculos, `HAVING`, `COALESCE` y ordenamientos.

## Estructura 
intermedio/ejercicio-047/
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