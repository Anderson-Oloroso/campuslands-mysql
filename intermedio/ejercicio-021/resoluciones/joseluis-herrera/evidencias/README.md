# Ejercicio 021 - Normalizacion 1FN para dibujo digital

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se creó la tabla `dibujos_digitales` con atributos atómicos para cumplir 1FN.
- Se utilizaron `PRIMARY KEY`, `NOT NULL`, `ENUM` y `CHECK`.
- Se insertaron 10 registros.
- Se utilizaron filtros `WHERE`, `GROUP BY`, `ORDER BY`, `AVG`, `COUNT` y `LIMIT`.

## Estructura 
intermedio/ejercicio-021/
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