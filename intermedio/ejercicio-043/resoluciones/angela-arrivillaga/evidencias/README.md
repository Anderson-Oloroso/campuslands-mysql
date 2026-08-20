# ejercicio 043 - tablas puente para catalogo de peliculas de miedo

## estructura del proyecto
angela-arrivillaga/
├── ddl/schema.sql
├── dml/inserts.sql
├── dql/consultas.sql
└── evidencias/README.md

## decisiones tecnicas
* se implemento una relación N:M entre `peliculas` y `subgeneros` mediante una tabla puente `peliculas_subgeneros`.
* uso de `group_concat` para presentar reportes legibles de categorías múltiples por película.
* restricción `CHECK` aplicada al campo `puntaje_terror` para asegurar una escala válida de 0.0 a 10.0.
* integridad referencial con `ON DELETE CASCADE` en la tabla puente para mantener la consistencia al eliminar registros.

## evidencias de ejecucion
* se validó que la tabla puente permite asociar dinámicamente múltiples etiquetas a una misma película sin duplicar información.
* las consultas responden correctamente a requerimientos de agrupación (COUNT, GROUP BY) y filtrado relacional.