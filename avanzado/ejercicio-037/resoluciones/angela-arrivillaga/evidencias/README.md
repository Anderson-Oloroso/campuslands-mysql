# ejercicio 037 - vistas avanzadas para liga de futbol

## estructura del proyecto

angela-arrivillaga/
├── ddl/
│   └── schema.sql
├── dml/
│   └── inserts.sql
├── dql/
│   └── consultas.sql
└── evidencias/
    └── README.md

## ejecucion

1. ejecutar ddl/schema.sql.
2. ejecutar dml/inserts.sql.
3. ejecutar dql/consultas.sql.

## decisiones tecnicas

* uso de vistas para abstraer la complejidad de los joins entre equipos y partidos.
* normalizacion de datos para evitar redundancia en nombres de equipos.
* uso de restricciones check para garantizar la integridad de los resultados numericos.

## resultados esperados

* visualizacion clara de los enfrentamientos con nombres reales de equipos.
* calculos estadisticos sobre el rendimiento de cada equipo en la liga.