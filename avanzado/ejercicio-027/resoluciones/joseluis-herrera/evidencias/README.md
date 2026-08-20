# Ejercicio 027 - Window Functions para videojuego de acción y aventura

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Base de datos `campuslands_mysql`.
- Tabla `jugadores`.
- Restricciones `CHECK` para nivel, puntuación y monedas.
- 10 registros de prueba.
- Uso de `RANK`, `ROW_NUMBER`, `AVG OVER`, `SUM OVER`, `LAG` y `LEAD`.

## Estructura 
avanzado/ejercicio-027/
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