# Ejercicio 044 - Event Scheduler para saga de ciencia ficcion

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se crearon las tablas `misiones` y `bitacora_eventos`.
- Se utilizaron restricciones `CHECK`, `NOT NULL`, `ENUM` y una validación de fechas.
- Se insertaron 10 misiones con diferentes estados, niveles, puntajes y categorías.
- Se creó el evento `actualizar_estado_misiones`, ejecutado cada minuto.
- El evento actualiza automáticamente el estado de las misiones y registra su ejecución en `bitacora_eventos`.
- Se utilizaron filtros, ordenamientos, agregaciones, `GROUP BY`, `LIMIT`, subconsulta y consultas de verificación del evento.

## Estructura 
avanzado/ejercicio-044/
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