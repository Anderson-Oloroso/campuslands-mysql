# Ejercicio 036 - WHERE para Autos Hiperdeportivos

## Descripción
Solución básica en MySQL centrada en la práctica profesional de la cláusula **WHERE** para el filtrado preciso de registros, aplicando operadores lógicos, rangos y condiciones sobre un inventario de vehículos hiperdeportivos.

## Estructura de Archivos
- ddl/schema.sql: Creación de base de datos y tabla principal de hiperdeportivos (Autos_hiperdeportivos) con restricciones de validación estrictas.
- dml/inserts.sql: Inserción estructurada de 8 registros realistas de vehículos con potencias, velocidades, precios y estados variados.
- dql/consultas.sql: 5 consultas básicas enfocadas en el uso de WHERE con operadores de comparación, rangos (BETWEEN), listas (IN) y filtros por texto (LIKE).

## Instrucciones de Ejecución
Ejecutar secuencialmente en MySQL Workbench o consola:
1. source ddl/schema.sql;
2. source dml/inserts.sql;
3. source dql/consultas.sql;
