-- Consultas base. Completa o reemplaza segun el enunciado.
USE campuslands_mysql;

SELECT 
    producto_id,
    sku,
    nombre_producto,
    nombre_categoria,
    vendedor,
    precio_usd,
    stock_disponible
FROM vw_catalogo_disponible
ORDER BY precio_usd DESC;

SELECT 
    vendedor_id,
    nombre_tienda,
    total_ordenes_procesadas,
    unidades_vendidas,
    ingresos_totales_usd
FROM vw_resumen_ventas_vendedor
ORDER BY ingresos_totales_usd DESC;