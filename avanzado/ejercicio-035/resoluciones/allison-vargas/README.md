# Ejercicio 035 - Índices para Taller Mecánico de Motos

## Descripción
Solución avanzada en MySQL centrada en la optimización del rendimiento mediante la creación de **índices estratégicos (INDEX, UNIQUE INDEX)** sobre columnas de alta frecuencia de búsqueda y filtrado en un taller mecánico de motocicletas.

## Estructura de Archivos
- ddl/schema.sql: Creación de base de datos, tabla principal de órdenes de reparación (	aller_motos) con restricciones estrictas e índices optimizados.
- dml/inserts.sql: Inserción estructurada de 8 registros realistas de reparaciones con costos, fechas y estados variados.
- dql/consultas.sql: 5 consultas analíticas avanzadas que se benefician del uso de índices, filtros por rango de fechas y reportes con alias claros.

## Instrucciones de Ejecución
Ejecutar secuencialmente en MySQL Workbench o consola:
1. source ddl/schema.sql;
2. source dml/inserts.sql;
3. source dql/consultas.sql;
