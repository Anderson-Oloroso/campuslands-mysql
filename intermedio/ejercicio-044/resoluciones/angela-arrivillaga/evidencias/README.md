# ejercicio 044 - vistas simples para saga de ciencia ficcion

## estructura del proyecto
angela-arrivillaga/
├── ddl/schema.sql
├── dml/inserts.sql
├── dql/consultas.sql
└── evidencias/README.md

## decisiones tecnicas
* se implementaron vistas (`vista_jedi_activos`, `vista_planetas_poblados`) para simplificar consultas recurrentes sobre el estado de los personajes y la demografía de los planetas.
* validaciones `CHECK` en `poblacion_estimada` (no negativa) y `nivel_poder` (rango 1-100) para asegurar la consistencia del universo de la saga.
* uso de `ENUM` para manejar de forma robusta los estados de los personajes.

## evidencias de ejecucion
* se validó que las vistas simplifican el acceso a los datos filtrados, mejorando la legibilidad del código DQL.
* se confirmó la integridad de los datos mediante las restricciones aplicadas en la capa DDL.