# ejercicio 014 - event scheduler para saga de ciencia ficcion

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

* se utilizo la base de datos relacional `saga_sci_fi_db`.
* especialización en la creación y configuración del **Event Scheduler** en MySQL para automatizar tareas de mantenimiento temporal (actualización automática de estados de misiones espaciales y registro en bitácoras de auditoría).
* aplicación de tipos de datos estrictos, restricciones `CHECK` para garantizar presupuestos espaciales no negativos y porcentajes de éxito entre 0.00 y 100.00 con precisión `DECIMAL`.

## salida y resultados esperados

* listado completo del estado de misiones espaciales ordenadas por presupuesto estelar.
* filtrado de misiones en curso en sectores con nivel de peligro crítico.
* reporte estadístico agrupado por nivel de peligro galáctico con sumas de presupuestos y promedios de éxito.
* top 5 de misiones con mayor probabilidad de éxito estimado.
* reporte de auditoría de los eventos ejecutados automáticamente por el programador de tareas (`Event Scheduler`) de MySQL.

## evidencias

para demostrar la correcta ejecucion:

* ddl: diseño de esquema relacional con claves primarias, foráneas protegidas y tabla de bitácora para eventos.
* dml: inserción robusta de registros espaciales y definición formal de un evento programado periódico en MySQL.
* dql: consultas avanzadas de reporte, filtrado y validación de la bitácora de eventos automáticos.