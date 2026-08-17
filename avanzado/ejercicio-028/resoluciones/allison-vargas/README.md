# Ejercicio 028 - JSON en MySQL para Academia Tech

## Descripción
Solución avanzada en MySQL que implementa el manejo de columnas de tipo JSON para almacenar configuraciones, metadatos y detalles de cursos o estudiantes en una academia tecnológica.

## Estructura de Archivos
- ddl/schema.sql: Creación de base de datos y tabla con columna JSON y restricciones CHECK.
- dml/inserts.sql: Inserción de 8 registros con estructuras JSON válidas.
- dql/consultas.sql: 5 consultas avanzadas extrayendo datos con operadores JSON (->, ->>, JSON_EXTRACT).

## Instrucciones de Ejecución
Ejecutar secuencialmente en MySQL Workbench o consola:
1. source ddl/schema.sql;
2. source dml/inserts.sql;
3. source dql/consultas.sql;
