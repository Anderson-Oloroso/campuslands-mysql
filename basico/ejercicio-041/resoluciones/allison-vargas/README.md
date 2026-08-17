# Ejercicio 041 - Validaciones simples para Pingpong

## Descripción
Solución básica en MySQL centrada en la implementación de **validaciones y restricciones simples** (como CHECK, NOT NULL y DEFAULT), aplicada a un sistema de gestión de partidos y torneos de pingpong.

## Estructura de Archivos
- ddl/schema.sql: Creación de base de datos y tabla principal de partidos (partidos_pingpong) con restricciones de validación estrictas para sets y estados.
- dml/inserts.sql: Inserción estructurada de 8 registros iniciales de encuentros de tenis de mesa con puntajes y estados variados.
- dql/consultas.sql: 5 consultas analíticas básicas utilizando filtros, funciones de agregación y reportes con alias claros.

## Instrucciones de Ejecución
Ejecutar secuencialmente en MySQL Workbench o consola:
1. source ddl/schema.sql;
2. source dml/inserts.sql;
3. source dql/consultas.sql;
