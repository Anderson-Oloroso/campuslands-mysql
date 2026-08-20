# ejercicio 023 - normalizacion 3fn para arquitectura 3d

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

* se utilizo la base de datos `arquitectura_3d_db`.
* cumplimiento de la tercera forma normal (3fn):
  - se cumple con 1fn (atomicidad de campos) y 2fn (ausencia de dependencias parciales mediante llaves primarias bien definidas).
  - se elimino toda dependencia transitiva aislando las entidades referenciales `clientes` y `estilos_arquitectonicos` en tablas independientes, asegurando que los atributos no clave dependan unica y directamente de la clave primaria de su respectiva tabla.
* se implementaron restricciones de dominio (`check`) para asegurar valores logicos en areas de construccion y presupuestos, ademas de llaves foraneas con integridad referencial estricta.

## salida y resultados esperados

* listado de proyectos entregados con detalle de cliente y estilo arquitectonico.
* filtrado de proyectos de gran escala segun el area de construccion.
* reporte agrupado de horas y fases de render por proyecto.
* filtrado de proyectos en desarrollo activo.
* analisis estadistico de presupuesto por estilo arquitectonico.

## evidencias

para demostrar la correcta ejecucion:

* ddl: creacion de tablas relacionales con normalizacion estricta en 3fn.
* dml: insercion de registros coherentes en las cuatro tablas del modelo.
* dql: consultas ejecutadas exitosamente respondiendo a requerimientos de negocio.