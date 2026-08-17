-- DQL: Reportes de inventario, ventas y efectividad de procedimientos almacenados
USE campuslands_mysql;

-- 1. Detalle de ventas registradas mediante el procedimiento almacenado
SELECT 
    v.venta_id,
    v.cliente_nombre,
    p.nombre AS producto,
    p.categoria,
    p.talla,
    dv.cantidad,
    dv.precio_unitario,
    v.monto_total
FROM ventas_ropa v
INNER JOIN detalle_ventas_ropa dv ON v.venta_id = dv.venta_id
INNER JOIN productos_ropa p ON dv.producto_id = p.producto_id
ORDER BY v.venta_id ASC;

-- 2. Estado del inventario actualizado tras ventas y reabastecimientos
SELECT 
    producto_id,
    nombre,
    categoria,
    talla,
    precio,
    stock AS stock_actual
FROM productos_ropa
ORDER BY stock ASC;

-- 3. Total de ingresos acumulados por categoría de prenda
SELECT 
    p.categoria,
    SUM(dv.cantidad) AS unidades_vendidas,
    SUM(dv.cantidad * dv.precio_unitario) AS ingresos_totales_usd
FROM detalle_ventas_ropa dv
INNER JOIN productos_ropa p ON dv.producto_id = p.producto_id
GROUP BY p.categoria
ORDER BY ingresos_totales_usd DESC;

-- 4. Ranking de prendas con mayor demanda
SELECT 
    p.nombre,
    p.talla,
    SUM(dv.cantidad) AS total_vendido
FROM detalle_ventas_ropa dv
INNER JOIN productos_ropa p ON dv.producto_id = p.producto_id
GROUP BY p.producto_id, p.nombre, p.talla
ORDER BY total_vendido DESC;

-- 5. Resumen general de facturación
SELECT 
    COUNT(venta_id) AS total_transacciones,
    SUM(monto_total) AS facturacion_total_usd,
    ROUND(AVG(monto_total), 2) AS ticket_promedio_usd
FROM ventas_ropa;
