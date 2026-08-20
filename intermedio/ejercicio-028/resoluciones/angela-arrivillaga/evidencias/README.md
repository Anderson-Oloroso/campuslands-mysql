# ejercicio 028 - tablas puente para academia tech

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

* se utilizo la base de datos `academia_tech_db`.
* uso de tabla puente `estudiantes_cursos` para gestionar la relacion de muchos a muchos entre estudiantes y cursos.
* se aplicaron restricciones de dominio (`check`) para validar rangos de calificaciones y costos no negativos, asi como una restriccion unica (`unique`) para evitar inscripciones duplicadas del mismo estudiante en un curso.

## salida y resultados esperados

* reporte completo de inscripciones de estudiantes en los cursos de la academia.
* listado de calificaciones finales de estudiantes aprobados.
* estadisticas de promedios de notas y conteo de inscritos por curso.
* seguimiento de estudiantes que se encuentran cursando activamente.
* consolidado analitico de ingresos financieros generados por curso.

## evidencias

para demostrar la correcta ejecucion:

* ddl: creacion de esquema relacional con tabla puente e integridad referencial.
* dml: poblacion de datos realistas para estudiantes, cursos e inscripciones.
* dql: consultas de reportes con uniones multiples y agregaciones financieras.