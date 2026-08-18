# Ejercicio 046 - INNER JOIN para restaurante de comida urbana

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se crearon las tablas `categorias` y `platos`.
- Se relacionaron mediante una clave foránea `id_categoria`.
- Se utilizaron `NOT NULL`, `CHECK`, `ENUM`, `PRIMARY KEY` y `FOREIGN KEY`.
- Se insertaron 5 categorías y 10 platos.
- Se utilizaron `INNER JOIN`, filtros, agrupaciones, cálculos, ordenamientos y `LIMIT`.

## Estructura 
intermedio/ejercicio-046/
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