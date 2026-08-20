

SELECT 
    p.platillo_id,
    p.nombre_platillo,
    c.nombre_categoria,
    p.precio_usd,
    p.es_vegetariano
FROM platillos p
INNER JOIN categorias_menu c ON p.categoria_id = c.categoria_id
ORDER BY c.nombre_categoria ASC, p.precio_usd DESC;

SELECT 
    o.orden_id,
    cl.nombre_completo AS cliente,
    cl.telefono,
    o.fecha_orden,
    o.tipo_servicio,
    o.estado_orden,
    SUM(d.cantidad * d.precio_unitario_usd) AS total_orden_usd
FROM ordenes_pedidos o
INNER JOIN clientes cl ON o.cliente_id = cl.cliente_id
INNER JOIN detalles_orden d ON o.orden_id = d.orden_id
GROUP BY o.orden_id, cl.nombre_completo, cl.telefono, o.fecha_orden, o.tipo_servicio, o.estado_orden
ORDER BY o.fecha_orden DESC;