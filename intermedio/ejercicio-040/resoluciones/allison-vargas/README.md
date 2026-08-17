# Ejercicio 040 - UNIQUE para Carreras Urbanas

## Descripción
Solución intermedia en MySQL centrada en la implementación de restricciones de unicidad (**UNIQUE**), aplicada a un sistema de gestión de corredores y eventos para carreras urbanas con el fin de evitar duplicidad en correos electrónicos o números de dorsal.

## Estructura de Archivos
- ddl/schema.sql: Creación de base de datos y diseño relacional con restricciones UNIQUE para asegurar la unicidad de dorsales y correos de participantes.
- dml/inserts.sql: Inserción estructurada de 8 registros de corredores con datos realistas y validación de restricciones.
- dql/consultas.sql: 5 consultas analíticas avanzadas utilizando funciones de agregación, filtros y reportes con alias claros.

## Instrucciones de Ejecución
Ejecutar secuencialmente en MySQL Workbench o consola:
1. source ddl/schema.sql;
2. source dml/inserts.sql;
3. source dql/consultas.sql;
