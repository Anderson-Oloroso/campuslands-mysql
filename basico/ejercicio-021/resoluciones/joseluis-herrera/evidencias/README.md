# Ejercicio 021 - WHERE para dibujo digital

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

* Se utilizó la base de datos `campuslands_mysql`.
* Se creó la tabla `dibujos_digitales` con información de dibujos, categoría, puntaje, estado y fecha.
* Se utilizó `PRIMARY KEY`, `NOT NULL`, `ENUM` y `CHECK` para validar los datos.
* Se insertaron 10 registros.
* Se utilizaron consultas con `WHERE`, `AND`, `BETWEEN`, comparaciones, `ORDER BY` y `AVG`.

## Estructura 
basico/ejercicio-021/
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