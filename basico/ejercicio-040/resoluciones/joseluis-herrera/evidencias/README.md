# Ejercicio 040 - COUNT y SUM para carreras urbanas

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

* Se utilizó la base de datos `campuslands_mysql`.
* Se creó la tabla `participantes` con restricciones `NOT NULL`, `CHECK` y `ENUM`.
* Se insertaron 8 participantes con diferentes categorías y estados.
* Se utilizaron `COUNT`, `SUM`, `WHERE`, `GROUP BY` y `ORDER BY`.
* Los datos permiten calcular participantes, distancias y tiempos acumulados.

## Estructura 
basico/ejercicio-040/
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