# Ejercicio 042 - Modelado de Entidad para Playlist Musical

## Descripción
Solución básica en MySQL centrada en el **modelado de entidades** y diseño estructurado de tablas, aplicada a un sistema de gestión de pistas, artistas y géneros para playlists musicales.

## Estructura de Archivos
- ddl/schema.sql: Creación de la base de datos y diseño relacional de la tabla principal de canciones (playlist_musical) con restricciones y validaciones estrictas.
- dml/inserts.sql: Inserción estructurada de 8 registros iniciales de temas musicales con duraciones, reproducciones y estados variados.
- dql/consultas.sql: 5 consultas analíticas básicas utilizando filtros, funciones de agregación y reportes con alias claros.

## Instrucciones de Ejecución
Ejecutar secuencialmente en MySQL Workbench o consola:
1. source ddl/schema.sql;
2. source dml/inserts.sql;
3. source dql/consultas.sql;
