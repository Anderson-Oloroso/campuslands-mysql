# Ejercicio 042 - Window Functions para Playlist Musical

## Descripción
Solución avanzada en MySQL centrada en el uso de **Funciones de Ventana (Window Functions)** como ROW_NUMBER(), RANK(), SUM() OVER() y AVG() OVER(), aplicada a un sistema de gestión de canciones, géneros y reproducción en playlists musicales.

## Estructura de Archivos
- ddl/schema.sql: Creación de la base de datos y la tabla transaccional de canciones (playlist_musical) con restricciones de validación estrictas.
- dml/inserts.sql: Inserción estructurada de 8 registros iniciales de temas musicales con duraciones, reproducciones y estados variados.
- dql/consultas.sql: 5 consultas analíticas avanzadas implementando funciones de ventana para rankings, acumulados y promedios por género.

## Instrucciones de Ejecución
Ejecutar secuencialmente en MySQL Workbench o consola:
1. source ddl/schema.sql;
2. source dml/inserts.sql;
3. source dql/consultas.sql;
