# Ejercicio 030 - Optimización para Equipo de Streaming

## Descripción
Solución avanzada en MySQL enfocada en la optimización del rendimiento de consultas mediante el diseño de esquemas eficientes, aplicación de índices (INDEX) y restricciones para el inventario de hardware y periféricos de un equipo de streaming.

## Estructura de Archivos
- ddl/schema.sql: Creación de base de datos, tabla principal de equipos de streaming con índices estratégicos y restricciones.
- dml/inserts.sql: Inserción de 8 registros realistas de dispositivos de streaming con precios, estados y métricas de rendimiento.
- dql/consultas.sql: 5 consultas optimizadas que utilizan índices, funciones de agregación y filtros avanzados.

## Instrucciones de Ejecución
Ejecutar secuencialmente en MySQL Workbench o consola:
1. source ddl/schema.sql;
2. source dml/inserts.sql;
3. source dql/consultas.sql;
