# Ejercicio 031 - INNER JOIN para Torneo Esports MOBA

## Descripción
Solución intermedia en MySQL centrada en el uso de uniones relacionales (INNER JOIN) para relacionar tablas normalizadas de patrocinadores y equipos participantes en un torneo de Esports MOBA.

## Estructura de Archivos
- ddl/schema.sql: Creación de base de datos, tablas normalizadas (patrocinadores y equipos_moba) con claves foráneas y restricciones de validación.
- dml/inserts.sql: Inserción de 4 registros de patrocinadores y al menos 8 registros de equipos profesionales de MOBA vinculados.
- dql/consultas.sql: 5 consultas analíticas avanzadas que explotan el operador INNER JOIN, funciones de agregación y filtros de rendimiento.

## Instrucciones de Ejecución
Ejecutar secuencialmente en MySQL Workbench o consola:
1. source ddl/schema.sql;
2. source dml/inserts.sql;
3. source dql/consultas.sql;
