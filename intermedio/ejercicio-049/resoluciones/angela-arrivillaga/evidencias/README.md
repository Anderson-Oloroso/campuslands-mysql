# ejercicio 049 - HAVING para paracaidismo

## estructura del proyecto
angela-arrivillaga/
├── ddl/schema.sql
├── dml/inserts.sql
├── dql/consultas.sql
└── evidencias/README.md

## decisiones tecnicas
* Se aplicó la cláusula `HAVING` en conjunto con funciones de agregación (`COUNT`, `AVG`, `SUM`, `MAX`) para filtrar resultados posteriores a los agrupamientos relacionales.
* Se estructuró un modelo relacional 1:N entre `zonas_salto` y `saltos`.
* Se implementaron restricciones `CHECK` rigurosas para asegurar que la altitud geográfica, la altura del salto y el tiempo de caída libre mantengan valores físicos válidos.
* Uso de alias claros y consistentes para facilitar la lectura de los indicadores analíticos.

## evidencias de ejecucion
* Se comprobó la ejecución correcta de los scripts DDL y DML sin errores de integridad referencial.
* Se validó que las consultas con `HAVING` filtran de forma adecuada las métricas de negocio establecidas para el paracaidismo.