# Ejercicio 023 - UPDATE para Arquitectura 3D

Módulo diseñado para la gestión y actualización de registros de proyectos de arquitectura 3D bajo la base de datos `campuslands_mysql`.

## Estructura de la Solución
- `ddl/schema.sql`: Creación de la base de datos y la tabla `basico_ejercicio_023` con restricciones de tipo `ENUM` y `DECIMAL`.
- `dml/inserts.sql`: Inserción inicial de 8 registros con datos realistas del sector de arquitectura.
- `dql/consultas.sql`: Sentencias `UPDATE` orientadasas a la manipulación de estados/costos y 5 consultas analíticas con `ORDER BY`, `GROUP BY` y filtros.

## Ejecución
1. Ejecutar el archivo `schema.sql` para configurar la estructura de la tabla.
2. Ejecutar el archivo `inserts.sql` para cargar los datos base.
3. Ejecutar el archivo `consultas.sql` para aplicar las modificaciones de datos (`UPDATE`) y generar los reportes analíticos.

## Decisiones Técnicas
- Se utilizó un campo `DECIMAL(12,2)` para los costos estimados con el fin de evitar pérdida de precisión numérica.
- Se implementaron restricciones `ENUM` en las columnas `categoria` y `estado` para garantizar la integridad y evitar entradas de texto erróneas.
- Se integraron operaciones de actualización (`UPDATE`) tanto puntuales (por ID) como masivas (por filtros de estado) para cumplir con el objetivo principal del ejercicio.