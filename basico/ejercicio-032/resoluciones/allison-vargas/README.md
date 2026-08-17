# Ejercicio 032 - Tipos de Datos para Ranking Battle Royale

## Descripción
Solución básica en MySQL centrada en la aplicación correcta de tipos de datos (INT, VARCHAR, DECIMAL, DATETIME, ENUM / restricciones) para la gestión del ranking y estadísticas de jugadores en un torneo Battle Royale.

## Estructura de Archivos
- ddl/schema.sql: Creación de base de datos y tabla principal (jugadores_br) con selección estricta de tipos de datos y restricciones de validación.
- dml/inserts.sql: Inserción de 8 registros realistas de competidores con puntajes precisos, fechas de registro y estados operativos.
- dql/consultas.sql: 5 consultas básicas enfocadas en filtrado por estado, ordenamiento por puntaje, cálculos con tipos numéricos y reportes con alias claros.

## Instrucciones de Ejecución
Ejecutar secuencialmente en MySQL Workbench o consola:
1. source ddl/schema.sql;
2. source dml/inserts.sql;
3. source dql/consultas.sql;
