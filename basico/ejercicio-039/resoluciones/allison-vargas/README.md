# Ejercicio 039 - DELETE controlado para Kickboxing

## Descripción
Solución básica en MySQL centrada en la práctica profesional de la sentencia **DELETE** de forma controlada y segura, aplicada a un sistema de gestión de combates y registros de eventos de kickboxing.

## Estructura de Archivos
- ddl/schema.sql: Creación de base de datos y tabla principal de combates (combates_kickboxing) con restricciones de validación estrictas.
- dml/inserts.sql: Inserción estructurada de 8 registros iniciales de combates con puntajes, categorías y estados variados.
- dql/consultas.sql: Incluye sentencias DELETE controladas mediante filtros específicos (WHERE), seguidas de 5 consultas básicas para verificar el estado de la tabla y generar reportes analíticos.

## Instrucciones de Ejecución
Ejecutar secuencialmente en MySQL Workbench o consola:
1. source ddl/schema.sql;
2. source dml/inserts.sql;
3. source dql/consultas.sql;
