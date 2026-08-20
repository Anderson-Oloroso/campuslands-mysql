# ejercicio 050 - subconsultas para estudio de tatuajes

## estructura del proyecto
angela-arrivillaga/
├── ddl/schema.sql
├── dml/inserts.sql
├── dql/consultas.sql
└── evidencias/README.md

## decisiones tecnicas
* Se aplicaron subconsultas escalares, de conjuntos (`IN`) y de agregación (`MAX`, `AVG`) para resolver indicadores de negocio complejos.
* Se estableció una relación jerárquica 1:N entre las entidades `tatuadores` y `tatuajes`.
* Se incorporaron restricciones `CHECK` para proteger la integridad del dominio financiero y la experiencia de los artistas.
* Uso de nombres explícitos y alias directos para mejorar la claridad de los reportes.

## evidencias de ejecucion
* Se confirmó la correcta ejecución de los scripts DDL y DML sin errores de sintaxis en MySQL.
* Se validó que las subconsultas devuelven los filtros esperados basados en valores agregados dinámicos.