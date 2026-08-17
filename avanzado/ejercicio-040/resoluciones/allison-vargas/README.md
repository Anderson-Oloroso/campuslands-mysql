# Ejercicio 040 - Backup Lógico para Carreras Urbanas

## Descripción
Solución avanzada en MySQL centrada en la estrategia y ejecución de **respaldos lógicos (Logical Backups)** mediante la herramienta mysqldump, aplicada a un sistema de gestión de inscripciones, tiempos y resultados para carreras urbanas.

## Estructura de Archivos
- ddl/schema.sql: Creación de la base de datos y la tabla transaccional de corredores y tiempos (carreras_urbanas) con restricciones de validación estrictas.
- dml/inserts.sql: Inserción estructurada de 8 registros iniciales de participantes con categorías, tiempos y estados variados.
- dql/consultas.sql: 5 consultas analíticas avanzadas para auditar tiempos, calcular promedios y generar reportes oficiales de la carrera urbana.

## Instrucciones de Ejecución y Backup
1. Ejecutar secuencialmente los scripts SQL en MySQL:
   - source ddl/schema.sql;
   - source dml/inserts.sql;
   - source dql/consultas.sql;
2. Generar el backup lógico desde la terminal con mysqldump:
   mysqldump -u root -p carreras_urbanas_backup_db > respaldo_carreras_urbanas.sql
