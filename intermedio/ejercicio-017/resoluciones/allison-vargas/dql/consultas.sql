-- DQL: Reportes usando LEFT JOIN para analizar cobertura de ventas e inventario
USE campuslands_mysql;

-- 1. Listado completo de prendas indicando sus unidades vendidas (incluyendo las sin venta)
SELECT 
    p.codigo_sku,
    p.nombre AS producto,
    p.categoria,
    p.precio,
    COALESCE(SUM(v.cantidad), 0) AS unidades_vendidas
FROM productos_ropa_left p
LEFT JOIN detalle_ventas_left v ON p.producto_id = v.producto_id
GROUP BY p.producto_id, p.codigo_sku, p.nombre, p.categoria, p.precio
ORDER BY unidades_vendidas DESC;

-- 2. Productos que NUNCA han sido vendidos (detección de stock estancado)
SELECT 
    p.codigo_sku,
    p.nombre AS producto_sin_venta,
    p.categoria,
    p.precio,
    p.stock
FROM productos_ropa_left p
LEFT JOIN detalle_ventas_left v ON p.producto_id = v.producto_id
WHERE v.venta_id IS NULL;

-- 3. Total facturado por producto incluyendo productos con .00 en ventas
SELECT 
    p.nombre AS producto,
    p.categoria,
    ROUND(COALESCE(SUM(v.cantidad * p.precio), 0.00), 2) AS ingresos_totales_usd
FROM productos_ropa_left p
LEFT JOIN detalle_ventas_left v ON p.producto_id = v.producto_id
GROUP BY p.producto_id, p.nombre, p.categoria
ORDER BY ingresos_totales_usd DESC;

-- 4. Resumen de movimiento de inventario por categoría
SELECT 
    p.categoria,
    COUNT(DISTINCT p.producto_id) AS total_modelos_catalogo,
    COUNT(v.venta_id) AS total_transacciones,
    COALESCE(SUM(v.cantidad), 0) AS prendas_despachadas
FROM productos_ropa_left p
LEFT JOIN detalle_ventas_left v ON p.producto_id = v.producto_id
GROUP BY p.categoria
ORDER BY prendas_despachadas DESC;

-- 5. Detalle de transacciones asociando prendas y clientes
SELECT 
    p.codigo_sku,
    p.nombre AS producto,
    COALESCE(v.cliente_nombre, 'SIN REGISTRO') AS cliente,
    COALESCE(v.cantidad, 0) AS cantidad_comprada,
    v.fecha_venta
FROM productos_ropa_left p
LEFT JOIN detalle_ventas_left v ON p.producto_id = v.producto_id
ORDER BY p.codigo_sku ASC, v.fecha_venta DESC;
