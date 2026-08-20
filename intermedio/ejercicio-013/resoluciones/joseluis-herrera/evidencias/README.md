# Ejercicio 013 - Tablas puente para catálogo de películas de miedo

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se crearon las tablas `peliculas`, `actores` y `pelicula_actor`.
- Se utilizó `pelicula_actor` como tabla puente para la relación muchos a muchos.
- Se aplicaron claves primarias, claves foráneas, `ENUM` y validación del puntaje.
- Se insertaron 10 películas, 12 actores y relaciones entre películas y actores.
- Se utilizaron `JOIN`, `GROUP BY`, `HAVING`, filtros, ordenamientos y `LIMIT`. 

intermedio/ejercicio-013/
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