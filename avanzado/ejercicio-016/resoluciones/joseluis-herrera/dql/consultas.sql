USE campuslands_mysql;

SELECT
    p.id_pedido,
    c.nombre AS cliente,
    p.fecha_pedido,
    p.estado
FROM pedidos AS p
INNER JOIN clientes AS c
    ON p.id_cliente = c.id_cliente
ORDER BY p.fecha_pedido DESC;

SELECT
    p.id_pedido,
    c.nombre AS cliente,
    pl.nombre AS plato,
    dp.cantidad,
    dp.precio_unitario,
    ROUND(dp.cantidad * dp.precio_unitario, 2) AS subtotal
FROM detalle_pedido AS dp
INNER JOIN pedidos AS p
    ON dp.id_pedido = p.id_pedido
INNER JOIN clientes AS c
    ON p.id_cliente = c.id_cliente
INNER JOIN platos AS pl
    ON dp.id_plato = pl.id_plato
ORDER BY p.id_pedido;


SELECT
    p.id_pedido,
    c.nombre AS cliente,
    ROUND(SUM(dp.cantidad * dp.precio_unitario), 2) AS total_pedido
FROM pedidos AS p
INNER JOIN clientes AS c
    ON p.id_cliente = c.id_cliente
INNER JOIN detalle_pedido AS dp
    ON p.id_pedido = dp.id_pedido
GROUP BY
    p.id_pedido,
    c.nombre
ORDER BY total_pedido DESC;


SELECT
    i.id_inventario,
    pl.nombre AS plato,
    i.stock,
    i.ultima_actualizacion
FROM inventario AS i
INNER JOIN platos AS pl
    ON i.id_plato = pl.id_plato
ORDER BY i.stock ASC;

SELECT
    pl.nombre AS plato,
    pl.categoria,
    i.stock
FROM inventario AS i
INNER JOIN platos AS pl
    ON i.id_plato = pl.id_plato
WHERE i.stock <= 10
ORDER BY i.stock ASC;

SELECT
    pl.nombre AS plato,
    i.stock AS stock_actual,
    COALESCE(SUM(dp.cantidad), 0) AS unidades_vendidas
FROM platos AS pl
INNER JOIN inventario AS i
    ON pl.id_plato = i.id_plato
LEFT JOIN detalle_pedido AS dp
    ON pl.id_plato = dp.id_plato
GROUP BY
    pl.id_plato,
    pl.nombre,
    i.stock
ORDER BY unidades_vendidas DESC;