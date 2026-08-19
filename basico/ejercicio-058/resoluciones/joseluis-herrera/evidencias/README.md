# Evidencias - Ejercicio 058

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se creó la tabla `cursos_academia`.
- Se utilizó `estado` para diferenciar cursos activos e inactivos.
- Se aplicaron restricciones para duración y precio.
- Se insertaron 10 cursos.
- Se utilizaron filtros por estado, nivel, precio y duración, además de `GROUP BY`.

## Evidencias

Guardar evidencias de:

- Creación correcta de la tabla.
- Inserción de los 10 registros.
- Ejecución de las 6 consultas.
- Resultados de los filtros por estado.

## Estructura 
basico/ejercicio-058/
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