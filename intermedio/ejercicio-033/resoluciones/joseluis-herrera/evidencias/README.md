# Ejercicio 033 - GROUP BY para inventario de skins shooter

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se creó la tabla `inventario_skins`.
- Se utilizaron restricciones `PRIMARY KEY` y `CHECK` para validar precio, estado y rareza.
- Se insertaron 12 registros.
- Se utilizaron `GROUP BY`, `COUNT`, `AVG` y `SUM` para generar reportes agrupados.

## Estructura 
intermedio/ejercicio-033/
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