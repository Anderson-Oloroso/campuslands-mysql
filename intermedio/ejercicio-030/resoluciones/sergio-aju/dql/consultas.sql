USE campuslands_mysql;

-- 1. Reporte detallado de inventario asociando cada equipo con su respectiva bodega mediante JOIN
SELECT 
    i.codigo_serial,
    i.nombre_equipo,
    i.categoria,
    i.precio_venta,
    i.stock_actual,
    b.nombre_bodega AS bodega,
    b.ciudad,
    i.estado_inventario
FROM inventario_streaming i
JOIN bodegas_streaming b ON i.bodega_id = b.id
ORDER BY i.precio_venta DESC;

-- 2. Análisis de margen de ganancia unitario y potencial valor total por cada equipo cargado
SELECT 
    nombre_equipo,
    categoria,
    precio_compra,
    precio_venta,
    (precio_venta - precio_compra) AS margen_ganancia_unitario,
    stock_actual,
    (precio_venta * stock_actual) AS valor_potencial_inventario
FROM inventario_streaming
ORDER BY margen_ganancia_unitario DESC;

-- 3. Conteo de equipos y stock acumulado agrupados por categoría de streaming
SELECT 
    categoria,
    COUNT(*) AS total_modelos_registrados,
    SUM(stock_actual) AS stock_total_disponible,
    ROUND(AVG(precio_venta), 2) AS precio_venta_promedio
FROM inventario_streaming
GROUP BY categoria
ORDER BY stock_total_disponible DESC;

-- 4. Filtrar equipos cuyo estado de inventario sea 'activo' y cuyo stock sea menor o igual a 15 (alertas de reabastecimiento)
SELECT 
    i.codigo_serial,
    i.nombre_equipo,
    i.categoria,
    i.stock_actual,
    b.nombre_bodega
FROM inventario_streaming i
JOIN bodegas_streaming b ON i.bodega_id = b.id
WHERE i.estado_inventario = 'activo' AND i.stock_actual <= 15
ORDER BY i.stock_actual ASC;

-- 5. Top 3 equipos con mayor valor financiero acumulado en stock dentro del marketplace de streaming
SELECT 
    nombre_equipo,
    categoria,
    stock_actual,
    precio_venta,
    (stock_actual * precio_venta) AS valor_total_stock
FROM inventario_streaming
ORDER BY valor_total_stock DESC
LIMIT 3;