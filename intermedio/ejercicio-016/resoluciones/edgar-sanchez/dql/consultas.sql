SELECT 
    o.orden_id,
    m.numero_mesa,
    m.ubicacion_zona,
    o.nombre_mesero,
    p.nombre_producto,
    c.nombre_categoria,
    d.cantidad,
    d.precio_unitario_usd,
    (d.cantidad * d.precio_unitario_usd) AS subtotal_usd,
    o.fecha_hora_orden
FROM ordenes_restaurante o
INNER JOIN mesas_restaurante m ON o.mesa_id = m.mesa_id
INNER JOIN detalles_orden_comida d ON o.orden_id = d.orden_id
INNER JOIN productos_comida p ON d.producto_id = p.producto_id
INNER JOIN categorias_menu c ON p.categoria_id = c.categoria_id
ORDER BY o.orden_id ASC, d.detalle_id ASC;

SELECT 
    c.nombre_categoria,
    p.nombre_producto,
    SUM(d.cantidad) AS unidades_vendidas,
    SUM(d.cantidad * d.precio_unitario_usd) AS total_recaudado_usd
FROM detalles_orden_comida d
INNER JOIN ordenes_restaurante o ON d.orden_id = o.orden_id
INNER JOIN productos_comida p ON d.producto_id = p.producto_id
INNER JOIN categorias_menu c ON p.categoria_id = c.categoria_id
WHERE o.estado_orden = 'Atendida'
GROUP BY c.nombre_categoria, p.nombre_producto
ORDER BY total_recaudado_usd DESC;
