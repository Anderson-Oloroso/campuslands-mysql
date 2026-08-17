# Ejercicio 029 - Fechas Básicas para Marketplace de Accesorios

## Descripción
Solución básica en MySQL centrada en la manipulación y filtrado de fechas (DATE y DATETIME) para la gestión de lanzamientos de productos, registros y vigencia de garantías o campañas en un marketplace de accesorios.

## Estructura de Archivos
- ddl/schema.sql: Creación de base de datos y tabla con campos de fecha y restricciones de validación.
- dml/inserts.sql: Inserción de 8 registros de accesorios con fechas históricas, vigentes y futuras.
- dql/consultas.sql: 5 consultas básicas enfocadas en filtrado por rangos de fechas, ordenamiento cronológico y funciones temporales (YEAR, DATEDIFF).

## Instrucciones de Ejecución
Ejecutar secuencialmente en MySQL Workbench o consola:
1. source ddl/schema.sql;
2. source dml/inserts.sql;
3. source dql/consultas.sql;
