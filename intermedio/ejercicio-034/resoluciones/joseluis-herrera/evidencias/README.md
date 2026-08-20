# Ejercicio 034 - HAVING para garaje de motos

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se creó la tabla `motos` con información de marca, modelo, categoría, año, precio y estado.
- Se aplicaron restricciones `CHECK` para validar precio, año y estado.
- Se insertaron 10 registros coherentes.
- Se utilizaron filtros, ordenamientos, agregaciones, `GROUP BY`, `HAVING` y `LIMIT`.
- Se incluyeron consultas con `HAVING` para filtrar grupos según cantidad de motos y precio promedio.

## Estructura 
intermedio/ejercicio-034/
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