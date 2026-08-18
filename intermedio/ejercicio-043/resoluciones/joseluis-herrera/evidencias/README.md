# Ejercicio 043 - Tablas puente para catalogo de peliculas de miedo

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se crearon las tablas `peliculas`, `actores` y `pelicula_actor`.
- `pelicula_actor` representa la relación muchos a muchos entre películas y actores.
- Se utilizaron `PRIMARY KEY`, `FOREIGN KEY`, `UNIQUE`, `NOT NULL` y `CHECK`.
- Se insertaron 8 películas, 12 actores y 12 relaciones.
- Las consultas utilizan `JOIN`, `GROUP BY`, `HAVING`, `COUNT` y filtros.

## Estructura 
intermedio/ejercicio-043/
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