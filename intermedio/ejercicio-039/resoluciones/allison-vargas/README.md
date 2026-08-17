# Ejercicio 039 - FOREIGN KEY para Kickboxing

## Descripción
Solución intermedia en MySQL centrada en la implementación de **Claves Foráneas (FOREIGN KEY)** e integridad referencial, aplicada a un sistema de gestión de gimnasios y combates de kickboxing.

## Estructura de Archivos
- ddl/schema.sql: Creación de base de datos y diseño relacional con tablas maestras (gimnasios) y transaccionales (combates_kickboxing) unidas por restricciones de clave foránea.
- dml/inserts.sql: Inserción estructurada de datos maestros y 8 registros de combates vinculados correctamente a sus sedes organizadoras.
- dql/consultas.sql: 5 consultas analíticas avanzadas utilizando INNER JOIN, funciones de agregación y reportes con alias claros.

## Instrucciones de Ejecución
Ejecutar secuencialmente en MySQL Workbench o consola:
1. source ddl/schema.sql;
2. source dml/inserts.sql;
3. source dql/consultas.sql;
