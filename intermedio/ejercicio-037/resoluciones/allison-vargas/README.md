# Ejercicio 037 - Normalización 2FN para Liga de Fútbol

## Descripción
Solución intermedia en MySQL centrada en la aplicación de la **Segunda Forma Normal (2FN)**. Se parte de una estructura en 1FN y se eliminan las dependencias parciales separando las entidades en tablas normalizadas relacionales (equipos, jugadores y estadisticas_partidos) para una liga de fútbol profesional.

## Estructura de Archivos
- ddl/schema.sql: Creación de base de datos y diseño relacional en 2FN con llaves primarias compuestas/simples y restricciones de integridad referencial.
- dml/inserts.sql: Inserción estructurada de registros realistas en cada tabla relacionada respetando las dependencias funcionales.
- dql/consultas.sql: 5 consultas intermedias utilizando JOINs para consultar información normalizada, calcular promedios, rankings y reportes con alias claros.

## Instrucciones de Ejecución
Ejecutar secuencialmente en MySQL Workbench o consola:
1. source ddl/schema.sql;
2. source dml/inserts.sql;
3. source dql/consultas.sql;
