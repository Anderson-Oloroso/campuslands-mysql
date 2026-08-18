SELECT 
    p.producto_id,
    p.nombre_producto,
    c.nombre_categoria,
    p.talla,
    p.color,
    p.precio_venta_usd,
    p.stock_actual,
    COALESCE(SUM(v.cantidad), 0) AS total_unidades_vendidas,
    COALESCE(SUM(v.cantidad * v.precio_unidad_usd), 0.00) AS total_ingresos_usd
FROM productos_ropa p
INNER JOIN categorias_ropa c ON p.categoria_id = c.categoria_id
LEFT JOIN ventas_ropa v ON p.producto_id = v.producto_id
GROUP BY p.producto_id, p.nombre_producto, c.nombre_categoria, p.talla, p.color, p.precio_venta_usd, p.stock_actual
ORDER BY total_unidades_vendidas DESC;

SELECT 
    cl.cliente_id,
    cl.nombre_cliente,
    cl.correo,
    cl.fecha_registro,
    COUNT(v.venta_id) AS total_compras_realizadas,
    COALESCE(SUM(v.cantidad * v.precio_unidad_usd), 0.00) AS total_gastado_usd
FROM clientes_tienda cl
LEFT JOIN ventas_ropa v ON cl.cliente_id = v.cliente_id
GROUP BY cl.cliente_id, cl.nombre_cliente, cl.correo, cl.fecha_registro
ORDER BY total_gastado_usd DESC;
