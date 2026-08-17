# Ejercicio 030 - Relaciones Simples para Equipo de Streaming

## Descripción
Solución básica en MySQL enfocada en el establecimiento de relaciones simples de uno a muchos (One-to-Many) mediante claves foráneas para la gestión de categorías y equipos de streaming en una academia técnica.

## Estructura de Archivos
- ddl/schema.sql: Creación de base de datos, tabla independiente (categorias_streaming) y tabla dependiente (equipos_streaming) con restricciones de integridad referencial.
- dml/inserts.sql: Inserción de 8 registros de equipos asociados a sus respectivas categorías.
- dql/consultas.sql: 5 consultas básicas enfocadas en uniones simples (INNER JOIN), filtros, agrupamientos y reportes con alias claros.

## Instrucciones de Ejecución
Ejecutar secuencialmente en MySQL Workbench o consola:
1. source ddl/schema.sql;
2. source dml/inserts.sql;
3. source dql/consultas.sql;
