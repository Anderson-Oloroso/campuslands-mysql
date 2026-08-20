-- Consultas DQL y prueba de Procedimientos Almacenados
USE campuslands_mysql;

-- 1. Ejecución y prueba de SP 3: Reporte de inventario filtrado
CALL sp_reporte_inventario_categoria('camisas', 150.00);

-- 2. Ejecución y prueba de SP 2: Reabastecer prenda agotada y verificar cambio de estado
CALL sp_reabastecer_stock(8, 15);

SELECT id, nombre, stock, estado 
FROM prendas 
WHERE id = 8;

-- 3. Resumen general de ventas con detalle de descuento aplicado por tipo de cliente
SELECT 
    v.id AS venta_no,
    c.nombre AS cliente,
    c.tipo_cliente,
    v.subtotal,
    v.descuento AS ahorro_descuento,
    v.total AS total_pagado,
    v.fecha_venta
FROM ventas v
JOIN clientes c ON v.cliente_id = c.id
ORDER BY v.fecha_venta DESC;

-- 4. Top de prendas más vendidas y recaudación por producto
SELECT 
    p.id AS prenda_id,
    p.nombre AS prenda,
    p.categoria,
    SUM(dv.cantidad) AS total_unidades_vendidas,
    SUM(dv.subtotal) AS ingresos_totales
FROM detalle_ventas dv
JOIN prendas p ON dv.prenda_id = p.id
GROUP BY p.id, p.nombre, p.categoria
ORDER BY total_unidades_vendidas DESC;

-- 5. Indicador de valorización total del inventario actual por categoría
SELECT 
    categoria,
    COUNT(*) AS total_modelos,
    SUM(stock) AS total_prendas_fisicas,
    SUM(stock * precio) AS valor_monetario_inventario
FROM prendas
GROUP BY categoria
ORDER BY valor_monetario_inventario DESC;