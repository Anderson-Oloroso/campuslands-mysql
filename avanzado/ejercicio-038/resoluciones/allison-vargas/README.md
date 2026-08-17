# Ejercicio 038 - Roles y Permisos para Fútbol Sala

## Descripción
Solución avanzada en MySQL centrada en la administración de seguridad, creación de roles (CREATE ROLE), usuarios y asignación de privilegios (GRANT) para un sistema de gestión de torneos de fútbol sala.

## Estructura de Archivos
- ddl/schema.sql: Creación de base de datos, tablas de gestión de partidos y equipos (Futbol_sala) junto con la definición de roles y privilegios de seguridad.
- dml/inserts.sql: Inserción estructurada de 8 registros de partidos y estadísticas con estados y puntajes realistas.
- dql/consultas.sql: 5 consultas avanzadas para auditar usuarios, privilegios y evaluar estadísticas de rendimiento en la liga de fútbol sala.

## Instrucciones de Ejecución
Ejecutar secuencialmente en MySQL Workbench o consola:
1. source ddl/schema.sql;
2. source dml/inserts.sql;
3. source dql/consultas.sql;
