# Ejercicio 038 - Normalización 3FN para Fútbol Sala

## Descripción
Solución intermedia en MySQL centrada en la aplicación de la **Tercera Forma Normal (3FN)**. Se eliminan las dependencias transitivas aislando los atributos dependientes de otros que no sean clave (como la relación entre ciudades y sedes o categorías de equipos) en tablas maestras independientes (ciudades y equipos_sala).

## Estructura de Archivos
- ddl/schema.sql: Creación de base de datos y diseño relacional estricto en 3FN con claves foráneas e integridad referencial.
- dml/inserts.sql: Inserción estructurada de datos maestros y transaccionales (mínimo 8 registros por entidad principal).
- dql/consultas.sql: 5 consultas analíticas avanzadas combinando múltiples tablas mediante JOIN y reportes con alias claros.

## Instrucciones de Ejecución
Ejecutar secuencialmente en MySQL Workbench o consola:
1. source ddl/schema.sql;
2. source dml/inserts.sql;
3. source dql/consultas.sql;
