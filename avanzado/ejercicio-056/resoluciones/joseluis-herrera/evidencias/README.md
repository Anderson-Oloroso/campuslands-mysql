# Evidencias - Ejercicio 056

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se creó la tabla `personajes_rpg` con restricciones para validar los datos.
- Se insertaron 8 personajes RPG con diferentes clases, niveles, estadísticas, oro y estados.
- Se utilizaron CTE, agregaciones, filtros, ordenamientos, `CASE` y `DENSE_RANK()`.
- Las consultas permiten analizar personajes activos, estadísticas por clase, ranking de ataque, poder total y economía de los personajes.

## Evidencias

Guardar capturas que demuestren:

- Creación correcta de la tabla.
- Inserción de los 8 registros.
- Ejecución de las 5 consultas.
- Resultados de los rankings y cálculos principales.

## Estructura 
avanzado/ejercicio-056/
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