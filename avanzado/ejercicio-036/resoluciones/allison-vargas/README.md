# Ejercicio 036 - EXPLAIN para Autos Hiperdeportivos

## Descripción
Solución avanzada en MySQL centrada en el análisis y optimización de consultas mediante el uso de la sentencia **EXPLAIN**, evaluando planes de ejecución, uso de índices y rendimiento sobre un inventario de vehículos hiperdeportivos.

## Estructura de Archivos
- ddl/schema.sql: Creación de base de datos, tabla principal de hiperdeportivos (Autos_hiperdeportivos) con restricciones de validación e índices estratégicos para análisis con EXPLAIN.
- dml/inserts.sql: Inserción estructurada de 8 registros realistas de vehículos con precios, potencias, velocidades máximas y estados variados.
- dql/consultas.sql: 5 consultas avanzadas evaluadas con EXPLAIN para verificar el acceso a filas, escaneos de índices y rangos óptimos.

## Instrucciones de Ejecución
Ejecutar secuencialmente en MySQL Workbench o consola:
1. source ddl/schema.sql;
2. source dml/inserts.sql;
3. source dql/consultas.sql;
