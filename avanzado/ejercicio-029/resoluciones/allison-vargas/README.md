# Ejercicio 029 - Event Scheduler para Marketplace de Accesorios

## Descripción
Solución avanzada en MySQL que implementa el uso de programadores de eventos (EVENT SCHEDULER) para la automatización de cambios de estado en ofertas, expiración de carritos de compra o gestión de stock en un marketplace de accesorios de moda y tecnología.

## Estructura de Archivos
- ddl/schema.sql: Creación de base de datos, tablas principales (productos_accesorios, promociones_ofertas) y habilitación del Event Scheduler junto con la creación del evento automático.
- dml/inserts.sql: Inserción de 8 registros iniciales de accesorios con precios, stock y estados de oferta.
- dql/consultas.sql: 5 consultas avanzadas orientadas al monitoreo de stock, reportes de ofertas y métricas del marketplace.

## Instrucciones de Ejecución
Ejecutar secuencialmente en MySQL Workbench o consola:
1. source ddl/schema.sql;
2. source dml/inserts.sql;
3. source dql/consultas.sql;
