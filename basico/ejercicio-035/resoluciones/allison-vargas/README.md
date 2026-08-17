# Ejercicio 035 - SELECT para Taller Mecánico de Motos

## Descripción
Solución básica en MySQL centrada en la práctica profesional de la sentencia SELECT, filtrado de datos, proyecciones con alias claros y reportes para la gestión de un taller mecánico de motocicletas.

## Estructura de Archivos
- ddl/schema.sql: Creación de base de datos y tabla principal de órdenes de reparación (	aller_motos) con restricciones estrictas de validación.
- dml/inserts.sql: Inserción estructurada de 8 registros realistas de reparaciones con costos, fechas y estados variados.
- dql/consultas.sql: 5 consultas básicas enfocadas en proyección de columnas, filtrado por estados, ordenamientos y agregaciones con alias claros.

## Instrucciones de Ejecución
Ejecutar secuencialmente en MySQL Workbench o consola:
1. source ddl/schema.sql;
2. source dml/inserts.sql;
3. source dql/consultas.sql;
