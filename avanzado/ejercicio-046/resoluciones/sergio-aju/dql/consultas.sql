-- Script de Transacciones y Consultas DQL
USE campuslands_mysql;

-- ============================================================================
-- DEMOSTRACIÓN DE TRANSACCIONES (ACID)
-- ============================================================================

-- Transacción 1: Procesamiento exitoso de un pedido (COMMIT)
START TRANSACTION;

-- 1. Crear el encabezado del pedido
INSERT INTO pedidos (cliente_id, total, estado) 
VALUES (1, 105.00, 'completado');

SET @nuevo_pedido_id = LAST_INSERT_ID();

-- 2. Registrar el detalle
INSERT INTO detalle_pedidos (pedido_id, producto_id, cantidad, precio_unitario) VALUES
(@nuevo_pedido_id, 1, 2, 45.00), -- 2x Burger Smash ($90.00)
(@nuevo_pedido_id, 7, 1, 15.00); -- 1x Soda ($15.00)

-- 3. Descontar del inventario
UPDATE productos SET stock = stock - 2 WHERE id = 1;
UPDATE productos SET stock = stock - 1 WHERE id = 7;

-- 4. Bonificar puntos al cliente (1 punto por cada $10)
UPDATE clientes SET saldo_puntos = saldo_puntos + 10 WHERE id = 1;

COMMIT;


-- Transacción 2: Simulación de fallo e invalidez de pedido (ROLLBACK)
START TRANSACTION;

INSERT INTO pedidos (cliente_id, total, estado) 
VALUES (2, 18.00, 'pendiente');

SET @pedido_fallido_id = LAST_INSERT_ID();

-- Intentar vender un producto sin stock suficiente
INSERT INTO detalle_pedidos (pedido_id, producto_id, cantidad, precio_unitario) 
VALUES (@pedido_fallido_id, 8, 1, 18.00);

-- Si se detecta falta de stock o error en la regla de negocio, se reversa todo:
ROLLBACK;


-- ============================================================================
-- CONSULTAS DE REPORTE DE NEGOCIO (DQL)
-- ============================================================================

-- 1. Resumen de Ventas Totales por Cliente e Historial de Puntos
SELECT 
    c.id AS cliente_id,
    c.nombre AS cliente,
    c.saldo_puntos,
    COUNT(p.id) AS total_pedidos,
    COALESCE(SUM(p.total), 0.00) AS total_gastado
FROM clientes c
LEFT JOIN pedidos p ON c.id = p.cliente_id AND p.estado = 'completado'
GROUP BY c.id, c.nombre, c.saldo_puntos
ORDER BY total_gastado DESC;

-- 2. Top 5 Productos más Vendidos y Recaudación Generada
SELECT 
    pr.nombre AS producto,
    pr.categoria,
    SUM(dp.cantidad) AS unidades_vendidas,
    SUM(dp.subtotal) AS ingresos_generados
FROM detalle_pedidos dp
JOIN productos pr ON dp.producto_id = pr.id
JOIN pedidos p ON dp.pedido_id = p.id
WHERE p.estado = 'completado'
GROUP BY pr.id, pr.nombre, pr.categoria
ORDER BY unidades_vendidas DESC
LIMIT 5;

-- 3. Control de Inventario Critico (Stock menor a 10 unidades o Agotados)
SELECT 
    id,
    nombre,
    categoria,
    stock,
    estado,
    CASE 
        WHEN stock = 0 THEN 'REABASTECER URGENTE'
        WHEN stock <= 10 THEN 'STOCK BAJO'
        ELSE 'OK'
    END AS alerta_inventario
FROM productos
WHERE stock <= 10 OR estado = 'agotado'
ORDER BY stock ASC;

-- 4. Reporte Consolidado de Pedidos con Detalle Desglosado
SELECT 
    p.id AS pedido_no,
    c.nombre AS cliente,
    p.creado_en AS fecha_hora,
    GROUP_CONCAT(CONCAT(dp.cantidad, 'x ', pr.nombre) SEPARATOR ', ') AS resumen_platillos,
    p.total AS total_pagado,
    p.estado
FROM pedidos p
JOIN clientes c ON p.cliente_id = c.id
JOIN detalle_pedidos dp ON p.id = dp.pedido_id
JOIN productos pr ON dp.producto_id = pr.id
GROUP BY p.id, c.nombre, p.creado_en, p.total, p.estado
ORDER BY p.creado_en DESC;

-- 5. Promedio de Gasto por Pedido (Ticket Promedio) y Rendimiento General
SELECT 
    COUNT(DISTINCT p.id) AS pedidos_totales_completados,
    SUM(p.total) AS facturacion_total,
    AVG(p.total) AS ticket_promedio
FROM pedidos p
WHERE p.estado = 'completado';