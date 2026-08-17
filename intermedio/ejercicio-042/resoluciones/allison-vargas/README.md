# Ejercicio 042 - Consultas de Reportes para Playlist Musical

## Descripción
Solución intermedia en MySQL centrada en el diseño de **consultas de reportes analíticos** y agregaciones avanzadas, aplicada a un sistema de gestión de pistas, géneros y reproducción en playlists musicales.

## Estructura de Archivos
- ddl/schema.sql: Creación de la base de datos y diseño relacional de la tabla de canciones (playlist_musical) con restricciones de validación estrictas.
- dml/inserts.sql: Inserción estructurada de 8 registros iniciales de temas musicales con duraciones, reproducciones y estados variados.
- dql/consultas.sql: 5 consultas de reportes orientadas a negocio con agregaciones, filtros y alias claros.

## Instrucciones de Ejecución
Ejecutar secuencialmente en MySQL Workbench o consola:
1. source ddl/schema.sql;
2. source dml/inserts.sql;
3. source dql/consultas.sql;
