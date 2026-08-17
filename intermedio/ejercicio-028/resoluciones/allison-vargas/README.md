# Ejercicio 028 - Tablas Puente para Academia Tech

## Descripción
Solución intermedia en MySQL enfocada en el modelado de relaciones muchos a muchos (Many-to-Many) mediante una tabla puente para la gestión de estudiantes inscritos en múltiples cursos de una academia técnica.

## Estructura de Archivos
- ddl/schema.sql: Creación de base de datos, tablas principales (estudiantes, cursos) y tabla puente (inscripciones) con restricciones de integridad.
- dml/inserts.sql: Inserción de registros realistas para estudiantes, cursos y al menos 8 asociaciones en la tabla puente.
- dql/consultas.sql: 5 consultas con uniones (JOINs), agrupamientos y reportes analíticos.

## Instrucciones de Ejecución
Ejecutar secuencialmente en MySQL Workbench o consola:
1. source ddl/schema.sql;
2. source dml/inserts.sql;
3. source dql/consultas.sql;
