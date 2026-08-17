-- DQL: Reportes transaccionales de ventas, inventario y productos consumidos
USE campuslands_mysql;

-- 1. Detalle consolidado de pedidos procesados con sus productos correspondientes
SELECT 
    p.pedido_id,
    p.cliente_nombre,
    pr.nombre AS producto,
    pr.categoria,
    dp.cantidad,
    dp.precio_unitario,
    (dp.cantidad * dp.precio_unitario) AS subtotal_usd
FROM pedidos_urbano p
INNER JOIN detalle_pedidos_urbano dp ON p.pedido_id = dp.pedido_id
INNER JOIN productos_urbano pr ON dp.producto_id = pr.producto_id
ORDER BY p.pedido_id ASC;

-- 2. Ventas totales e ingresos acumulados por categoría de producto
SELECT 
    pr.categoria,
    SUM(dp.cantidad) AS unidades_vendidas,
    SUM(dp.cantidad * dp.precio_unitario) AS ingresos_totales_usd
FROM detalle_pedidos_urbano dp
INNER JOIN productos_urbano pr ON dp.producto_id = pr.producto_id
GROUP BY pr.categoria
ORDER BY ingresos_totales_usd DESC;

-- 3. Estado actual del stock de inventario tras la ejecución transaccional
SELECT 
    producto_id,
    nombre,
    categoria,
    precio,
    stock_disponible
FROM productos_urbano
ORDER BY stock_disponible ASC;

-- 4. Ranking de clientes por total gastado en el restaurante
SELECT 
    cliente_nombre,
    COUNT(pedido_id) AS total_pedidos,
    SUM(monto_total) AS total_invertido_usd
FROM pedidos_urbano
WHERE estado_pedido = 'procesado'
GROUP BY cliente_nombre
ORDER BY total_invertido_usd DESC;

-- 5. Ticket promedio de compra por pedido realizado
SELECT 
    COUNT(pedido_id) AS total_pedidos_procesados,
    ROUND(AVG(monto_total), 2) AS ticket_promedio_usd,
    MAX(monto_total) AS pedido_maximo_usd
FROM pedidos_urbano
WHERE estado_pedido = 'procesado';
