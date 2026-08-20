USE campuslands_mysql;

-- 1. Detalle completo de productos vendidos por pedido incluyendo categoría
SELECT 
    p.id AS pedido_id,
    p.numero_mesa,
    p.cliente_nombre,
    c.nombre AS categoria,
    pl.nombre AS platillo,
    dp.cantidad,
    dp.precio_unitario,
    (dp.cantidad * dp.precio_unitario) AS subtotal
FROM pedidos p
INNER JOIN detalle_pedidos dp ON p.id = dp.pedido_id
INNER JOIN platillos pl ON dp.platillo_id = pl.id
INNER JOIN categorias c ON pl.categoria_id = c.id
ORDER BY p.id ASC;

-- 2. Total consumido y facturado por cada pedido pagado
SELECT 
    p.id AS pedido_id,
    p.cliente_nombre,
    p.numero_mesa,
    SUM(dp.cantidad * dp.precio_unitario) AS total_pagado
FROM pedidos p
INNER JOIN detalle_pedidos dp ON p.id = dp.pedido_id
WHERE p.estado = 'pagado'
GROUP BY p.id, p.cliente_nombre, p.numero_mesa;

-- 3. Top platillos más vendidos ordenados por cantidad
SELECT 
    pl.nombre AS platillo,
    c.nombre AS categoria,
    SUM(dp.cantidad) AS unidades_vendidas,
    SUM(dp.cantidad * dp.precio_unitario) AS ingresos_generados
FROM platillos pl
INNER JOIN categorias c ON pl.categoria_id = c.id
INNER JOIN detalle_pedidos dp ON pl.id = dp.platillo_id
GROUP BY pl.id, pl.nombre, c.nombre
ORDER BY unidades_vendidas DESC;

-- 4. Ingresos recaudados agrupados por categoría de comida urbana
SELECT 
    c.nombre AS categoria,
    COUNT(DISTINCT dp.pedido_id) AS total_pedidos,
    SUM(dp.cantidad * dp.precio_unitario) AS total_ventas
FROM categorias c
INNER JOIN platillos pl ON c.id = pl.categoria_id
INNER JOIN detalle_pedidos dp ON pl.id = dp.platillo_id
GROUP BY c.id, c.nombre
ORDER BY total_ventas DESC;

-- 5. Consulta de pedidos actualmente en preparación o servidos con el detalle de items
SELECT 
    p.id AS pedido_id,
    p.numero_mesa,
    p.estado,
    GROUP_CONCAT(CONCAT(dp.cantidad, 'x ', pl.nombre) SEPARATOR ', ') AS resumen_platillos
FROM pedidos p
INNER JOIN detalle_pedidos dp ON p.id = dp.pedido_id
INNER JOIN platillos pl ON dp.platillo_id = pl.id
WHERE p.estado IN ('en_preparacion', 'servido')
GROUP BY p.id, p.numero_mesa, p.estado;