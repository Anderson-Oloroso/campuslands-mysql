# Ejercicio 037 - Vistas Avanzadas para Liga de Fútbol

## Descripción
Solución avanzada en MySQL centrada en la creación y explotación de **vistas avanzadas (CREATE VIEW)**, encapsulando lógica compleja de agregación, uniones y cálculos estadísticos para la gestión de una liga de fútbol profesional.

## Estructura de Archivos
- ddl/schema.sql: Creación de base de datos, tablas relacionales (equipos y partidos) con restricciones estrictas y creación de vistas avanzadas.
- dml/inserts.sql: Inserción estructurada de 8 registros de equipos y partidos con goles, fechas y estados realistas.
- dql/consultas.sql: 5 consultas avanzadas que explotan directamente las vistas creadas para generar reportes, rankings y análisis estadísticos.

## Instrucciones de Ejecución
Ejecutar secuencialmente en MySQL Workbench o consola:
1. source ddl/schema.sql;
2. source dml/inserts.sql;
3. source dql/consultas.sql;
