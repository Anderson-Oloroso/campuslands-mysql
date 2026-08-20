USE campuslands_mysql;

SELECT
    p.id_pedido,
    c.nombre AS cliente,
    p.fecha_pedido,
    p.estado
FROM pedidos AS p
INNER JOIN clientes AS c
    ON p.id_cliente = c.id_cliente
ORDER BY p.fecha_pedido ASC;

SELECT
    p.id_pedido,
    c.nombre AS cliente,
    pl.nombre AS plato,
    dp.cantidad,
    dp.precio_unitario
FROM detalle_pedido AS dp
INNER JOIN pedidos AS p
    ON dp.id_pedido = p.id_pedido
INNER JOIN clientes AS c
    ON p.id_cliente = c.id_cliente
INNER JOIN platos AS pl
    ON dp.id_plato = pl.id_plato
ORDER BY p.id_pedido ASC;

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
    c.id_cliente,
    c.nombre AS cliente,
    ROUND(SUM(dp.cantidad * dp.precio_unitario), 2) AS total_gastado
FROM clientes AS c
INNER JOIN pedidos AS p
    ON c.id_cliente = p.id_cliente
INNER JOIN detalle_pedido AS dp
    ON p.id_pedido = dp.id_pedido
GROUP BY
    c.id_cliente,
    c.nombre
ORDER BY total_gastado DESC;

SELECT
    pl.nombre AS plato,
    pl.categoria,
    SUM(dp.cantidad) AS unidades_vendidas
FROM platos AS pl
INNER JOIN detalle_pedido AS dp
    ON pl.id_plato = dp.id_plato
GROUP BY
    pl.id_plato,
    pl.nombre,
    pl.categoria
ORDER BY unidades_vendidas DESC;

SELECT
    p.id_pedido,
    c.nombre AS cliente,
    p.estado,
    ROUND(SUM(dp.cantidad * dp.precio_unitario), 2) AS total_pedido
FROM pedidos AS p
INNER JOIN clientes AS c
    ON p.id_cliente = c.id_cliente
INNER JOIN detalle_pedido AS dp
    ON p.id_pedido = dp.id_pedido
WHERE p.estado = 'Entregado'
GROUP BY
    p.id_pedido,
    c.nombre,
    p.estado
ORDER BY total_pedido DESC;