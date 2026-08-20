# Ejercicio 041 - CHECK para pingpong

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se creó la tabla `jugadores`.
- Se aplicaron restricciones `CHECK` para validar edad y estadísticas.
- Se utilizó `UNIQUE` para evitar rankings duplicados.
- Se insertaron 8 jugadores.
- Se utilizaron filtros, ordenamientos, `COUNT`, `SUM`, `AVG`, `GROUP BY` y `LIMIT`.

## Estructura 
intermedio/ejercicio-041/
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