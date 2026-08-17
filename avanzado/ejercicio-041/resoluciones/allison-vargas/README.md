# Ejercicio 041 - CTE para Pingpong

## Descripción
Solución avanzada en MySQL centrada en el uso de **Expresiones de Tabla Comunes (CTE - Common Table Expressions)** con cláusulas WITH, aplicada a un sistema de gestión de partidos, torneos y estadísticas de rendimiento en pingpong.

## Estructura de Archivos
- ddl/schema.sql: Creación de la base de datos y la tabla transaccional de partidos de pingpong (partidos_pingpong) con restricciones de validación estrictas.
- dml/inserts.sql: Inserción estructurada de 8 registros iniciales de encuentros de tenis de mesa con sets, puntajes y estados variados.
- dql/consultas.sql: 5 consultas analíticas avanzadas implementando CTEs para cálculos de rendimiento, rankings y filtros condicionales.

## Instrucciones de Ejecución
Ejecutar secuencialmente en MySQL Workbench o consola:
1. source ddl/schema.sql;
2. source dml/inserts.sql;
3. source dql/consultas.sql;
