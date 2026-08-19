# Evidencias - Ejercicio 057

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se creó la tabla `personajes_accion_aventura`.
- Se aplicaron restricciones para nivel, experiencia, monedas, salud y ataque.
- Se insertaron 10 personajes con diferentes clases, niveles, estadísticas y estados.
- Se utilizaron `RANK()`, `ROW_NUMBER()`, `LAG()`, `SUM() OVER()` y `AVG() OVER()`.
- Las consultas permiten comprobar rankings, posiciones por clase, diferencias de experiencia, acumulados y comparación con promedios.

## Evidencias

Guardar evidencias de:

- Creación correcta de la tabla.
- Inserción de los 10 registros.
- Ejecución de las 6 consultas.
- Resultados de los rankings y cálculos realizados con window functions.

## Estructura 
avanzado/ejercicio-057/
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

            