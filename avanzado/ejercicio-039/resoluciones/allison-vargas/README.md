# Ejercicio 039 - Bloqueos para Kickboxing

## Descripción
Solución avanzada en MySQL enfocada en la gestión de transacciones concurrentes y control de **bloqueos (Locks)**, como SELECT ... FOR UPDATE y LOCK TABLES, aplicada a un sistema de control de combates y registros de eventos de kickboxing.

## Estructura de Archivos
- ddl/schema.sql: Creación de la base de datos y la tabla transaccional de combates (combates_kickboxing) con motores InnoDB, restricciones de validación y soporte para control de concurrencia.
- dml/inserts.sql: Inserción estructurada de 8 registros iniciales de combates de kickboxing con estados, puntajes y categorías variadas.
- dql/consultas.sql: Implementación de transacciones con control de bloqueos explícitos (FOR UPDATE) y 5 consultas analíticas avanzadas para auditar estados y resultados.

## Instrucciones de Ejecución
Ejecutar secuencialmente en MySQL Workbench o consola:
1. source ddl/schema.sql;
2. source dml/inserts.sql;
3. source dql/consultas.sql;
