-- DQL: Reportes relacionales combinando tablas con INNER JOIN
USE campuslands_mysql;

-- 1. Detalle completo de ordenes con cliente, platillo y total calculado
SELECT 
    p.pedido_id,
    c.nombre AS cliente,
    c.tipo_cliente,
    pl.nombre AS platillo,
    pl.categoria,
    p.cantidad,
    pl.precio AS precio_unitario_usd,
    (p.cantidad * pl.precio) AS total_orden_usd
FROM pedidos_urbano_join p
INNER JOIN clientes_urbano c ON p.cliente_id = c.cliente_id
INNER JOIN platillos_urbano pl ON p.platillo_id = pl.platillo_id
ORDER BY p.pedido_id ASC;

-- 2. Consumo acumulado e inversión por tipo de cliente
SELECT 
    c.tipo_cliente,
    COUNT(DISTINCT c.cliente_id) AS total_clientes,
    SUM(p.cantidad) AS total_unidades_compradas,
    ROUND(SUM(p.cantidad * pl.precio), 2) AS total_gastado_usd
FROM pedidos_urbano_join p
INNER JOIN clientes_urbano c ON p.cliente_id = c.cliente_id
INNER JOIN platillos_urbano pl ON p.platillo_id = pl.platillo_id
GROUP BY c.tipo_cliente
ORDER BY total_gastado_usd DESC;

-- 3. Platillo más vendido por cantidad de unidades consumidas
SELECT 
    pl.nombre AS platillo,
    pl.categoria,
    SUM(p.cantidad) AS total_unidades_vendidas,
    ROUND(SUM(p.cantidad * pl.precio), 2) AS ingresos_totales_usd
FROM pedidos_urbano_join p
INNER JOIN platillos_urbano pl ON p.platillo_id = pl.platillo_id
GROUP BY pl.platillo_id, pl.nombre, pl.categoria
ORDER BY total_unidades_vendidas DESC;

-- 4. Consumo específico realizado por clientes VIP
SELECT 
    c.nombre AS cliente,
    pl.nombre AS platillo,
    p.cantidad,
    (p.cantidad * pl.precio) AS total_usd
FROM pedidos_urbano_join p
INNER JOIN clientes_urbano c ON p.cliente_id = c.cliente_id
INNER JOIN platillos_urbano pl ON p.platillo_id = pl.platillo_id
WHERE c.tipo_cliente = 'vip'
ORDER BY total_usd DESC;

-- 5. Ventas por categoría de platillos en el restaurante
SELECT 
    pl.categoria,
    COUNT(p.pedido_id) AS numero_ordenes,
    ROUND(SUM(p.cantidad * pl.precio), 2) AS facturacion_categoria_usd
FROM pedidos_urbano_join p
INNER JOIN platillos_urbano pl ON p.platillo_id = pl.platillo_id
GROUP BY pl.categoria
ORDER BY facturacion_categoria_usd DESC;
