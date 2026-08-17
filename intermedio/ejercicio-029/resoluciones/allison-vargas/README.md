# Ejercicio 029 - Vistas Simples para Marketplace de Accesorios

## Descripción
Solución intermedia en MySQL centrada en la creación y consulta de vistas (CREATE VIEW) para encapsular consultas complejas sobre productos, stock y precios en un marketplace de accesorios de moda y tecnología.

## Estructura de Archivos
- ddl/schema.sql: Creación de base de datos, tabla principal de accesorios y definición de la vista simple para productos activos.
- dml/inserts.sql: Inserción de 8 registros realistas de accesorios con diferentes categorías, precios y estados.
- dql/consultas.sql: 5 consultas avanzadas que operan directamente sobre la vista creada y tablas base para reportes de negocio.

## Instrucciones de Ejecución
Ejecutar secuencialmente en MySQL Workbench o consola:
1. source ddl/schema.sql;
2. source dml/inserts.sql;
3. source dql/consultas.sql;
