# ejercicio 037 - order by para liga de futbol

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

* se utilizo la base de datos relacional `liga_futbol_db`.
* especialización en la aplicación de ordenamientos múltiples mediante la cláusula `ORDER BY` combinando criterios de puntaje, diferencia de goles calculada, orden alfabético y antigüedad de fundaciones.
* aplicación de tipos de datos estrictos, restricciones `CHECK` para validar rangos de años de fundación coherentes y puntajes o estadísticas de goles no negativos.

## salida y resultados esperados

* tabla de clasificación general de la liga ordenada por puntos y diferencia de goles.
* listado alfabético estructurado de todos los clubes registrados.
* ranking ofensivo basado en la cantidad de goles a favor de cada equipo.
* top 5 de los mejores equipos líderes de la competición.
* reporte cronológico de equipos activos ordenados desde el club más antiguo hasta el más reciente.

## evidencias

para demostrar la correcta ejecucion:

* ddl: diseño de esquema relacional robusto con llaves primarias y foráneas protegidas.
* dml: inserción de múltiples registros con estadísticas deportivas detalladas y realistas.
* dql: consultas optimizadas orientadas al uso intensivo de ordenamientos ascendentes, descendentes y múltiples columnas con `ORDER BY`.