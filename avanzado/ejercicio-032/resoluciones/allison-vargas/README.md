# Ejercicio 032 - Procedimientos Almacenados para Ranking Battle Royale

## Descripción
Solución avanzada en MySQL centrada en el diseño y ejecución de procedimientos almacenados (STORED PROCEDURES) para la gestión dinámica de puntajes, consultas de ranking y actualización de estados en una plataforma de torneos Battle Royale.

## Estructura de Archivos
- ddl/schema.sql: Creación de base de datos, tabla principal de jugadores de Battle Royale con restricciones y definición de procedimientos almacenados.
- dml/inserts.sql: Inserción de 8 registros de jugadores profesionales con kills, puntajes y rangos iniciales.
- dql/consultas.sql: 5 consultas y llamadas a procedimientos almacenados que demuestran lógica de negocio, reportes y filtrado avanzado.

## Instrucciones de Ejecución
Ejecutar secuencialmente en MySQL Workbench o consola:
1. source ddl/schema.sql;
2. source dml/inserts.sql;
3. source dql/consultas.sql;
