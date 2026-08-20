# Ejercicio 014 - Event Scheduler para saga de ciencia ficción

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se crearon las tablas `peliculas` y `control_eventos`.
- Se aplicaron `PRIMARY KEY`, `ENUM` y validación del puntaje.
- Se insertaron 10 registros.
- Se creó el Event Scheduler `evento_revision_peliculas`, ejecutado cada minuto.
- El evento registra automáticamente su última ejecución.
- Se utilizaron filtros, agregaciones, ordenamientos, `LIMIT` y consultas de eventos.

## Estructura 
avanzado/ejercicio-014/
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