# Ejercicio 035 - Subconsultas para Taller Mecánico de Motos

## Descripción
Solución intermedia en MySQL enfocada en el uso avanzado de **subconsultas (SUBQUERIES)** tanto escalares como correlacionadas para resolver problemas complejos de filtrado y comparación en la gestión de un taller mecánico de motocicletas.

## Estructura de Archivos
- ddl/schema.sql: Creación de base de datos y tabla principal de órdenes de reparación (	aller_motos) con restricciones de validación estrictas.
- dml/inserts.sql: Inserción estructurada de 8 registros realistas de reparaciones con costos, fechas y estados variados.
- dql/consultas.sql: 5 consultas intermedias que explotan subconsultas para calcular promedios dinámicos, identificar registros máximos/mínimos y filtrar conjuntos de datos de manera avanzada.

## Instrucciones de Ejecución
Ejecutar secuencialmente en MySQL Workbench o consola:
1. source ddl/schema.sql;
2. source dml/inserts.sql;
3. source dql/consultas.sql;
