USE campuslands_mysql;

-- 1. Consultar todos los pedidos ordenados por fecha de creación de forma descendente
SELECT codigo_pedido, cliente, accesorio, categoria, precio_unitario, cantidad, fecha_creacion, estado_pedido
FROM pedidos_marketplace_avanzado
ORDER BY fecha_creacion DESC;

-- 2. Filtrar los pedidos que se encuentran en estado 'caducado' (procesados automáticamente por el Event Scheduler)
SELECT codigo_pedido, cliente, accesorio, fecha_creacion, estado_pedido
FROM pedidos_marketplace_avanzado
WHERE estado_pedido = 'caducado'
ORDER BY fecha_creacion ASC;

-- 3. Conteo de pedidos agrupados por su estado actual para evaluar métricas operativas del marketplace
SELECT estado_pedido, COUNT(*) AS total_pedidos
FROM pedidos_marketplace_avanzado
GROUP BY estado_pedido
ORDER BY total_pedidos DESC;

-- 4. Reporte de ventas potenciales o ingresos totales agrupados por categoría considerando solo pedidos activos o entregados
SELECT categoria, COUNT(*) AS total_pedidos, SUM(precio_unitario * cantidad) AS ingreso_total
FROM pedidos_marketplace_avanzado
WHERE estado_pedido IN ('pendiente', 'enviado', 'entregado')
GROUP BY categoria
ORDER BY ingreso_total DESC;

-- 5. Verificación del estado del Programador de Eventos (Event Scheduler) en el servidor MySQL
SHOW VARIABLES LIKE 'event_scheduler';