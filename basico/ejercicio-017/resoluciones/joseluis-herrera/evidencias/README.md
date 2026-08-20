# Ejercicio 017 - Tipos de datos para tienda de ropa

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se creó la tabla `productos`.
- Se utilizaron `INT`, `VARCHAR`, `DECIMAL`, `BOOLEAN` y `DATE` según el tipo de información.
- Se aplicaron restricciones `NOT NULL` y `CHECK` para validar precio y stock.
- Se insertaron 10 registros.
- Se utilizaron filtros, ordenamientos, `AVG`, `COUNT`, `GROUP BY` y `LIMIT`.

# Estructura 
basico/ejercicio-017/
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