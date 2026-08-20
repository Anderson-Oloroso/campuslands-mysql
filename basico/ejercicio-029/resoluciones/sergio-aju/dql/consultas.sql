USE campuslands_mysql;

-- 1. Consultar pedidos realizados en el mes de agosto de 2026 ordenados por fecha de más reciente a más antigua
SELECT codigo_pedido, cliente, accesorio, precio_unitario, cantidad, fecha_pedido, estado_pedido
FROM pedidos_marketplace
WHERE fecha_pedido >= '2026-08-01' AND fecha_pedido <= '2026-08-31'
ORDER BY fecha_pedido DESC;

-- 2. Conteo de pedidos y valor total vendido agrupados por fecha de pedido
SELECT fecha_pedido, COUNT(*) AS total_pedidos, SUM(precio_unitario * cantidad) AS ingreso_total_dia
FROM pedidos_marketplace
GROUP BY fecha_pedido
ORDER BY fecha_pedido DESC;

-- 3. Filtrar pedidos que fueron entregados y ocurrieron antes del mes de agosto de 2026
SELECT codigo_pedido, cliente, accesorio, fecha_pedido, estado_pedido
FROM pedidos_marketplace
WHERE estado_pedido = 'entregado' AND fecha_pedido < '2026-08-01'
ORDER BY fecha_pedido ASC;

-- 4. Top 3 pedidos más recientes registrados en el marketplace
SELECT codigo_pedido, cliente, accesorio, fecha_pedido, estado_pedido
FROM pedidos_marketplace
ORDER BY fecha_pedido DESC
LIMIT 3;

-- 5. Listar pedidos pendientes o en estado de envío con su antigüedad calculada en días respecto a la fecha actual simulada
SELECT codigo_pedido, cliente, accesorio, fecha_pedido, estado_pedido,
       DATEDIFF('2026-08-18', fecha_pedido) AS dias_transcurridos
FROM pedidos_marketplace
WHERE estado_pedido IN ('pendiente', 'enviado')
ORDER BY fecha_pedido ASC;