USE campuslands_mysql;

-- 1. Mostrar los pedidos junto con el nombre y ciudad del cliente.
SELECT
    p.id_pedido,
    c.nombre AS cliente,
    c.ciudad,
    p.fecha_pedido,
    p.estado
FROM pedidos AS p
INNER JOIN clientes AS c
    ON p.id_cliente = c.id_cliente
ORDER BY p.fecha_pedido;


-- 2. Mostrar el detalle de cada pedido junto con el nombre del producto.
SELECT
    dp.id_detalle,
    dp.id_pedido,
    pr.nombre AS producto,
    pr.categoria,
    dp.cantidad,
    dp.precio_unitario
FROM detalle_pedido AS dp
INNER JOIN productos AS pr
    ON dp.id_producto = pr.id_producto
ORDER BY dp.id_pedido, pr.nombre;


-- 3. Mostrar un reporte completo de pedidos con cliente, producto y subtotal.
SELECT
    p.id_pedido,
    c.nombre AS cliente,
    pr.nombre AS producto,
    dp.cantidad,
    dp.precio_unitario,
    dp.cantidad * dp.precio_unitario AS subtotal,
    p.estado AS estado_pedido
FROM pedidos AS p
INNER JOIN clientes AS c
    ON p.id_cliente = c.id_cliente
INNER JOIN detalle_pedido AS dp
    ON p.id_pedido = dp.id_pedido
INNER JOIN productos AS pr
    ON dp.id_producto = pr.id_producto
ORDER BY p.id_pedido, subtotal DESC;


-- 4. Calcular el total de cada pedido.
SELECT
    p.id_pedido,
    c.nombre AS cliente,
    SUM(dp.cantidad * dp.precio_unitario) AS total_pedido
FROM pedidos AS p
INNER JOIN clientes AS c
    ON p.id_cliente = c.id_cliente
INNER JOIN detalle_pedido AS dp
    ON p.id_pedido = dp.id_pedido
GROUP BY p.id_pedido, c.nombre
ORDER BY total_pedido DESC;


-- 5. Mostrar los productos vendidos y la cantidad total solicitada.
SELECT
    pr.nombre AS producto,
    pr.categoria,
    SUM(dp.cantidad) AS cantidad_vendida
FROM productos AS pr
INNER JOIN detalle_pedido AS dp
    ON pr.id_producto = dp.id_producto
GROUP BY pr.id_producto, pr.nombre, pr.categoria
ORDER BY cantidad_vendida DESC;


-- 6. Mostrar únicamente los pedidos entregados con su total.
SELECT
    p.id_pedido,
    c.nombre AS cliente,
    p.fecha_pedido,
    SUM(dp.cantidad * dp.precio_unitario) AS total_pedido
FROM pedidos AS p
INNER JOIN clientes AS c
    ON p.id_cliente = c.id_cliente
INNER JOIN detalle_pedido AS dp
    ON p.id_pedido = dp.id_pedido
WHERE p.estado = 'entregado'
GROUP BY p.id_pedido, c.nombre, p.fecha_pedido
ORDER BY total_pedido DESC;


-- 7. Mostrar cuánto ha gastado cada cliente en sus pedidos.
SELECT
    c.id_cliente,
    c.nombre AS cliente,
    COUNT(DISTINCT p.id_pedido) AS total_pedidos,
    SUM(dp.cantidad * dp.precio_unitario) AS gasto_total
FROM clientes AS c
INNER JOIN pedidos AS p
    ON c.id_cliente = p.id_cliente
INNER JOIN detalle_pedido AS dp
    ON p.id_pedido = dp.id_pedido
GROUP BY c.id_cliente, c.nombre
ORDER BY gasto_total DESC;