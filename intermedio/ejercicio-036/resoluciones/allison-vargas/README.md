# Ejercicio 036 - Normalización 1FN para Autos Hiperdeportivos

## Descripción
Solución intermedia en MySQL centrada en la aplicación de la **Primera Forma Normal (1FN)**, garantizando que todos los atributos sean atómicos, sin grupos repetitivos y con dominios de datos estrictos para un sistema de vehículos hiperdeportivos.

## Estructura de Archivos
- ddl/schema.sql: Creación de base de datos y tabla principal de hiperdeportivos (Autos_hiperdeportivos) estructurada en 1FN con restricciones de atomicidad y validación.
- dml/inserts.sql: Inserción estructurada de 8 registros atómicos y realistas de vehículos hiperdeportivos con especificaciones técnicas detalladas.
- dql/consultas.sql: 5 consultas analíticas intermedias orientadas a evaluar datos atómicos, rangos y reportes con alias claros.

## Instrucciones de Ejecución
Ejecutar secuencialmente en MySQL Workbench o consola:
1. source ddl/schema.sql;
2. source dml/inserts.sql;
3. source dql/consultas.sql;
