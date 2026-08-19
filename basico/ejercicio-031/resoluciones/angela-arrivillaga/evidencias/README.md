# ejercicio 031 - create table para torneo esports moba

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

* se utilizo la base de datos `torneo_moba_db`.
* diseño relacional con tablas normalizadas para equipos de esports y jugadores moba.
* aplicacion de restricciones de dominio (`check`) para validar años de fundación y niveles de KDA no negativos.

## salida y resultados esperados

* listado completo de jugadores con su equipo y rol ordenados por rendimiento.
* filtrado de jugadores de élite con KDA superior a 5.00.
* resumen estadístico de rendimiento agrupado por rol principal.
* catálogo de equipos esports ordenados por antigüedad.
* análisis comparativo de KDA máximo y promedio por equipo.

## evidencias

para demostrar la correcta ejecucion:

* ddl: creacion de tablas normalizadas con restricciones e integridad referencial.
* dml: inserción de registros realistas con roles y métricas de juego.
* dql: ejecución de consultas de reportes con uniones, agrupaciones y alias claros.