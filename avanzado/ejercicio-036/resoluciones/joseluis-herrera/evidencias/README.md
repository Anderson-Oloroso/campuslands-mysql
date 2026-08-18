# Ejercicio 036 - EXPLAIN para autos hiperdeportivos

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se creó la tabla `autos_hiperdeportivos` con restricciones para año, potencia, velocidad, precio y estado.
- Se insertaron 10 registros coherentes.
- Se crearon índices sobre estado, marca, potencia, velocidad y precio para analizar las consultas.
- Se utilizaron 6 consultas con `EXPLAIN` y una consulta para comprobar resultados reales.


## Estructura 
avanzado/ejercicio-036/
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