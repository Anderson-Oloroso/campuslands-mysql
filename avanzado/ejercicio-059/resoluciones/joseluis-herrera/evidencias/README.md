# Evidencias - Ejercicio 059

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Esperar al menos 1 minuto para permitir la ejecución del evento.
4. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se creó la tabla `productos_accesorios`.
- Se aplicaron restricciones para precio y stock.
- Se insertaron 10 productos.
- Se creó el evento `actualizar_revision_productos`.
- El evento actualiza cada minuto la fecha de revisión de los productos activos.
- Se utilizaron filtros, `GROUP BY`, agregaciones y consultas de validación del evento.

## Evidencias

Guardar evidencias de:

- Creación de la tabla.
- Creación y habilitación del Event Scheduler.
- Inserción de los 10 registros.
- Ejecución del evento después de un minuto.
- Cambio de `ultima_revision`.
- Resultados de las 6 consultas.


## Estructura 
avanzado/ejercicio-059/
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