# Ejercicio 051 - WHERE para dibujo digital

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se creó la tabla `dibujos` con validaciones para precio y estado.
- Se insertaron 10 registros con diferentes técnicas, niveles, precios y estados.
- Se utilizaron consultas `WHERE` con igualdad, comparación, `BETWEEN`, `AND` y `<>`.

## Estructura 
basico/ejercicio-051/
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