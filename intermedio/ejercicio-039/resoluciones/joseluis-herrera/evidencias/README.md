# Ejercicio 039 - FOREIGN KEY para kickboxing

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

* Se utilizó la base de datos `campuslands_mysql`.
* Se crearon las tablas `categorias` y `peleadores`.
* `peleadores.id_categoria` utiliza una `FOREIGN KEY` hacia `categorias.id_categoria`.
* Se aplicaron restricciones `NOT NULL`, `CHECK`, `UNIQUE` y `ENUM`.
* Se insertaron 4 categorías y 8 peleadores.
* Se utilizaron `INNER JOIN`, `LEFT JOIN`, filtros, `GROUP BY`, agregaciones, ordenamientos y `LIMIT`.


## Estructura 
intermedio/ejercicio-039/
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