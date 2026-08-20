# Ejercicio 051 - Normalizacion 1FN para dibujo digital

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se creó la tabla `dibujos` con atributos atómicos para cumplir 1FN.
- Se utilizaron restricciones para validar precio, nivel de dificultad y estado.
- Se insertaron 10 registros con datos variados.
- Se utilizaron filtros, agrupaciones, agregaciones, ordenamientos y ranking.

## Estructura 
intermedio/ejercicio-051/
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