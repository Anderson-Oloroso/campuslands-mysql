# Ejercicio 033 - GROUP BY para Inventario de Skins Shooter

## Descripción
Solución intermedia en MySQL centrada en el uso avanzado de funciones de agregación y agrupamiento (GROUP BY, HAVING) para analizar métricas financieras y operativas del inventario de skins en un videojuego tipo shooter.

## Estructura de Archivos
- ddl/schema.sql: Creación de base de datos y tabla principal (skins_shooter) con restricciones de validación y tipos de datos estrictos.
- dml/inserts.sql: Inserción de 8 registros de skins con precios, rarezas, armas y estados variados.
- dql/consultas.sql: 5 consultas analíticas que explotan GROUP BY, funciones estadísticas (SUM, AVG, MAX, MIN, COUNT) y filtros de grupos con HAVING.

## Instrucciones de Ejecución
Ejecutar secuencialmente en MySQL Workbench o consola:
1. source ddl/schema.sql;
2. source dml/inserts.sql;
3. source dql/consultas.sql;
