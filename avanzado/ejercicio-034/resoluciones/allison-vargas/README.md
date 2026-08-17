# Ejercicio 034 - Triggers para Garaje de Motos

## Descripción
Solución avanzada en MySQL centrada en la implementación de **disparadores (TRIGGERS)** para auditar y automatizar el control de inventario, registro de bitácoras y validaciones de capacidad en un garaje de motocicletas.

## Estructura de Archivos
- ddl/schema.sql: Creación de base de datos, tablas de inventario (motos_garaje) y auditoría (itacora_motos), junto con la definición de triggers (BEFORE INSERT, AFTER UPDATE).
- dml/inserts.sql: Inserción de 8 registros iniciales de motocicletas con sus respectivos estados, cilindradas y costos de mantenimiento.
- dql/consultas.sql: 5 consultas analíticas avanzadas que evalúan la bitácora generada por los triggers, reportes de estado y costos acumulados.

## Instrucciones de Ejecución
Ejecutar secuencialmente en MySQL Workbench o consola:
1. source ddl/schema.sql;
2. source dml/inserts.sql;
3. source dql/consultas.sql;
