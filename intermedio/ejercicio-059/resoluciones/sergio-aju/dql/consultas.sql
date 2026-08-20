USE campuslands_mysql;

-- 1. Consulta directa a la vista 'vw_catalogo_activos' filtrada por productos de color Negro
SELECT 
    sku,
    nombre_producto,
    nombre_categoria,
    precio,
    stock_disponible,
    vendedor
FROM vw_catalogo_activos
WHERE color_dominante LIKE '%Negro%'
ORDER BY precio DESC;

-- 2. Alerta de reabastecimiento consultando la vista 'vw_inventario_critico'
SELECT 
    sku,
    nombre_producto,
    nombre_tienda,
    stock_disponible,
    diagnostico_stock
FROM vw_inventario_critico
ORDER BY stock_disponible ASC;

-- 3. Análisis de ventas brutas y comisiones por vendedor usando 'vw_ventas_por_vendedor'
SELECT 
    nombre_tienda,
    comision_porcentaje,
    total_pedidos_atendidos,
    total_ventas_brutas,
    ganancia_marketplace_comision
FROM vw_ventas_por_vendedor
ORDER BY total_ventas_brutas DESC;

-- 4. Búsqueda de pedidos completados o en camino usando 'vw_resumen_pedidos'
SELECT 
    pedido_id,
    cliente_nombre,
    ciudad,
    DATE_FORMAT(fecha_pedido, '%Y-%m-%d %H:%i') AS fecha_formateada,
    monto_total,
    estado_pedido
FROM vw_resumen_pedidos
WHERE estado_pedido IN ('Pagado', 'Enviado', 'Entregado')
ORDER BY monto_total DESC;

-- 5. Ranking Top de Productos con precio mayor a 300 Q. en el catálogo disponible
SELECT 
    nombre_producto,
    nombre_categoria,
    vendedor,
    precio,
    stock_disponible
FROM vw_catalogo_activos
WHERE precio >= 300.00
ORDER BY precio DESC
LIMIT 5;