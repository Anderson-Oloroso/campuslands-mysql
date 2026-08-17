# Ejercicio 031 - CREATE TABLE para Torneo Esports MOBA

## Descripción
Solución básica en MySQL centrada en la sentencia CREATE TABLE para el modelado, restricción y estructuración de datos de equipos participantes en un torneo de Esports MOBA.

## Estructura de Archivos
- ddl/schema.sql: Creación de base de datos y tabla principal (equipos_moba) con restricciones de validación y tipos de datos estrictos.
- dml/inserts.sql: Inserción de 8 registros de equipos profesionales de MOBA con estadísticas, puntajes y estados operativos.
- dql/consultas.sql: 5 consultas básicas enfocadas en filtrado por estado, ordenamiento por puntaje, agrupamientos y reportes con alias claros.

## Instrucciones de Ejecución
Ejecutar secuencialmente en MySQL Workbench o consola:
1. source ddl/schema.sql;
2. source dml/inserts.sql;
3. source dql/consultas.sql;
