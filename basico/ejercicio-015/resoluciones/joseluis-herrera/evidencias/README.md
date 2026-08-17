# Ejercicio 015 - Relaciones simples para biblioteca gamer

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se crearon las tablas `usuarios` y `videojuegos`.
- Se utilizó `usuario_id` como clave foránea para relacionar ambas tablas.
- Se aplicaron `UNIQUE`, `ENUM` y validación del puntaje.
- Se insertaron 4 usuarios y 10 videojuegos.
- Se utilizaron `JOIN`, filtros, `GROUP BY`, `AVG`, `COUNT`, ordenamientos y `LIMIT`.

## Estructura 
basico/ejercicio-015/
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