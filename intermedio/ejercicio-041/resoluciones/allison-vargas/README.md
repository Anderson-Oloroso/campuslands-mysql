# Ejercicio 041 - CHECK para Pingpong

## Descripción
Solución intermedia en MySQL centrada en la implementación avanzada de restricciones **CHECK** para la validación estricta de reglas de negocio en partidos de pingpong (como límites de sets por encuentro y formato de fases).

## Estructura de Archivos
- ddl/schema.sql: Creación de base de datos y diseño de la tabla de partidos (partidos_pingpong) con múltiples restricciones CHECK para asegurar la integridad de los puntajes y estados.
- dml/inserts.sql: Inserción estructurada de 8 registros de encuentros de tenis de mesa cumpliendo rigurosamente con las reglas de validación.
- dql/consultas.sql: 5 consultas analíticas avanzadas utilizando funciones de agregación, filtros condicionales y reportes con alias claros.

## Instrucciones de Ejecución
Ejecutar secuencialmente en MySQL Workbench o consola:
1. source ddl/schema.sql;
2. source dml/inserts.sql;
3. source dql/consultas.sql;
