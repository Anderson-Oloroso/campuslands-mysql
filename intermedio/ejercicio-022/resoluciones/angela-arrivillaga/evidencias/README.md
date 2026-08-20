# ejercicio 022 - normalizacion 2fn para animacion 3d

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

* se utilizo la base de datos `animacion_3d_db`.
* cumplimiento de la segunda forma normal (2fn):
  - todas las tablas se encuentran en primera forma normal (1fn) asegurando atomicidad.
  - se elimino la dependencia parcial extrayendo los datos de los motores de render (`motores_render`) a una entidad independiente relacionada por clave foránea, evitando redundancia de atributos dependientes del motor (como empresa desarrolladora y versión) en la tabla principal de proyectos.
* se estructuraron tablas relacionales para el control de proyectos y las secuencias de renderizado asociadas.
* se aplicaron restricciones de validacion estrictas (`check` y `foreign key`) para garantizar la integridad referencial y de dominio.

## salida y resultados esperados

* consulta de proyectos finalizados unidos con su motor de render.
* filtrado de secuencias de render de alta exigencia temporal.
* reporte agrupado de consumo de almacenamiento por proyecto.
* filtrado de proyectos en etapas activas de render y post-produccion.
* analisis estadistico por motor de render utilizando funciones de agregacion.

## evidencias

para demostrar la correcta ejecucion:

* ddl: captura de consola ejecutando comandos de creacion de esquema y llaves foraneas.
* dml: validacion de insercion exitosa en las tres tablas normalizadas.
* dql: salida en consola de las consultas relacionales y de agregacion.