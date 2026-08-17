# Ejercicio 038 - UPDATE para Fútbol Sala

## Descripción
Solución básica en MySQL centrada en la práctica profesional de la sentencia **UPDATE** para modificar y actualizar registros en una base de datos orientada a la gestión de partidos y equipos de fútbol sala.

## Estructura de Archivos
- ddl/schema.sql: Creación de base de datos y tabla principal de partidos de fútbol sala (partidos_futbol_sala) con restricciones de validación estrictas.
- dml/inserts.sql: Inserción estructurada de 8 registros iniciales de partidos con marcadores, fechas y estados variados.
- dql/consultas.sql: Incluye sentencias UPDATE para actualizar marcadores y estados de partidos, seguidas de 5 consultas básicas para verificar los cambios y generar reportes analíticos.

## Instrucciones de Ejecución
Ejecutar secuencialmente en MySQL Workbench o consola:
1. source ddl/schema.sql;
2. source dml/inserts.sql;
3. source dql/consultas.sql;
