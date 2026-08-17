# Ejercicio 030 - Carga de Datos para Equipo de Streaming

## Descripción
Solución intermedia en MySQL centrada en la estrategia de carga masiva y estructurada de datos (BULK INSERT / DML) para la gestión de proveedores, lotes de importación y equipos de streaming en una academia técnica.

## Estructura de Archivos
- ddl/schema.sql: Creación de base de datos, tablas normalizadas (proveedores y equipos_streaming) con restricciones de integridad y validaciones de carga.
- dml/inserts.sql: Inserción estructurada de proveedores y al menos 8 registros de equipos con control de lotes y fechas de recepción.
- dql/consultas.sql: 5 consultas analíticas avanzadas que explotan la carga de datos para reportes de inventario y trazabilidad.

## Instrucciones de Ejecución
Ejecutar secuencialmente en MySQL Workbench o consola:
1. source ddl/schema.sql;
2. source dml/inserts.sql;
3. source dql/consultas.sql;
