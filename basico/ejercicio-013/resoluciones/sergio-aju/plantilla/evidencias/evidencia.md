# Ejercicio 013 - Catálogo de Películas de Miedo

## Autor
Sergio Miranda

## Descripción
Modelado de datos en MySQL para un sistema de gestión de películas de terror, enfocado en el filtrado por estados operativos y análisis de calificaciones.

## Orden de Ejecución
1. Ejecutar el script `ddl/schema.sql` para inicializar la base de datos y la estructura de la tabla.
2. Ejecutar el script `dml/inserts.sql` para cargar el catálogo inicial de películas.
3. Ejecutar las consultas de reporte y filtrado en `dql/consultas.sql`.

## Decisiones Técnicas
- Se implementó un campo `ENUM` para manejar los estados del ciclo de vida de la película ('Disponible', 'Proximamente', 'Archivada').
- Se utilizó una restricción `CHECK` en el campo `puntaje` para validar que los valores se mantengan estrictamente en el rango de 0.0 a 10.0.