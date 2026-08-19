# ejercicio 024 - foreign key para soldadura

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

* se utilizo la base de datos `soldadura_db`.
* aplicacion estricta de restricciones `foreign key`:
  - se conecto la tabla principal `juntas_soldadas` mediante claves foráneas hacia las catálogos `procesos_soldadura` y `soldadores`.
  - se configuraron reglas de integridad referencial (`on delete restrict` y `on update cascade`) para proteger la consistencia de los datos relacionales.
* se implementaron restricciones de dominio (`check`) para garantizar valores fisicos reales en espesores de material y amperajes de equipo.

## salida y resultados esperados

* listado de juntas soldadas aprobadas con detalles de proceso y soldador responsable.
* filtrado de juntas de alta resistencia segun su espesor en milimetros.
* reporte de productividad y desempeño por soldador.
* filtrado de juntas con inspecciones pendientes.
* analisis estadistico de espesores y amperajes agrupados por proceso de soldadura.

## evidencias

para demostrar la correcta ejecucion:

* ddl: creacion de llaves foraneas y restricciones de dominio.
* dml: insercion de registros en las tablas relacionadas.
* dql: consultas relacionales con uniones y agregaciones exitosas.