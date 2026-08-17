# Ejercicio 040 - COUNT y SUM para Carreras Urbanas

## Descripción
Solución básica en MySQL centrada en la práctica profesional de las funciones de agregación **COUNT** y **SUM**, aplicada a un sistema de gestión de registros de corredores, distancias y tiempos para carreras urbanas.

## Estructura de Archivos
- ddl/schema.sql: Creación de base de datos y tabla principal de corredores (carreras_urbanas) con restricciones de validación estrictas.
- dml/inserts.sql: Inserción estructurada de 8 registros iniciales de participantes con distancias, tiempos y estados variados.
- dql/consultas.sql: Incluye consultas analíticas basadas en COUNT y SUM para auditar totales de participantes, acumular distancias recorridas y generar reportes financieros o de rendimiento.

## Instrucciones de Ejecución
Ejecutar secuencialmente en MySQL Workbench o consola:
1. source ddl/schema.sql;
2. source dml/inserts.sql;
3. source dql/consultas.sql;
