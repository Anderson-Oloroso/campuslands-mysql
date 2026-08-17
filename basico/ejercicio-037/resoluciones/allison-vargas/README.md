# Ejercicio 037 - ORDER BY para Liga de Fútbol

## Descripción
Solución básica en MySQL centrada en la práctica profesional de la cláusula **ORDER BY** para ordenar resultados de forma ascendente y descendente, aplicando criterios múltiples y reportes ordenados para equipos de una liga de fútbol.

## Estructura de Archivos
- ddl/schema.sql: Creación de base de datos y tabla principal de equipos de fútbol (equipos_liga) con restricciones de validación estrictas.
- dml/inserts.sql: Inserción estructurada de 8 registros realistas de equipos con puntos, goles, partidos jugados y estados variados.
- dql/consultas.sql: 5 consultas básicas enfocadas en el uso de ORDER BY con columnas múltiples, orden ascendente y descendente, y límites de resultados.

## Instrucciones de Ejecución
Ejecutar secuencialmente en MySQL Workbench o consola:
1. source ddl/schema.sql;
2. source dml/inserts.sql;
3. source dql/consultas.sql;
