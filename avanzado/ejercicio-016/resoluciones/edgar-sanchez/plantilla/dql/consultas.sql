SELECT 
    o.orden_id,
    o.fecha_orden,
    c.nombre_cliente,
    c.telefono,
    c.saldo_monedero AS saldo_actual_monedero,
    o.total_orden,
    o.estado_orden
FROM ordenes o
INNER JOIN clientes c ON o.cliente_id = c.cliente_id
ORDER BY o.orden_id ASC;

SELECT 
    o.orden_id,
    p.nombre_producto,
    p.categoria,
    do.cantidad,
    do.precio_historico,
    do.subtotal,
    p.stock_disponible AS stock_restante_producto
FROM detalles_orden do
INNER JOIN ordenes o ON do.orden_id = o.orden_id
INNER JOIN productos_menu p ON do.producto_id = p.producto_id
ORDER BY o.orden_id ASC, p.nombre_producto ASC;