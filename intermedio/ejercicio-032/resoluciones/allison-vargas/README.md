# Ejercicio 032 - LEFT JOIN para Ranking Battle Royale

## Descripción
Solución intermedia en MySQL enfocada en el uso de uniones izquierdas (LEFT JOIN) para relacionar clanes o escuadrones con jugadores de Battle Royale, permitiendo identificar clanes sin miembros activos y evaluar la integridad de los datos.

## Estructura de Archivos
- ddl/schema.sql: Creación de base de datos, tablas normalizadas (clanes_br y jugadores_br) con claves foráneas, restricciones de integridad y validaciones.
- dml/inserts.sql: Inserción de registros de clanes (incluyendo un clan sin jugadores para probar el LEFT JOIN) y al menos 8 registros de jugadores vinculados.
- dql/consultas.sql: 5 consultas analíticas avanzadas que explotan el operador LEFT JOIN, funciones de agregación y reportes con alias claros.

## Instrucciones de Ejecución
Ejecutar secuencialmente en MySQL Workbench o consola:
1. source ddl/schema.sql;
2. source dml/inserts.sql;
3. source dql/consultas.sql;
