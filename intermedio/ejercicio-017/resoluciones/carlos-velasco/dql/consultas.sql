USE campuslands_mysql;


-- 1. Mostrar todos los clientes junto con sus pedidos.
-- Los clientes sin pedidos también deben aparecer.
SELECT
    c.id_cliente,
    c.nombre AS cliente,
    c.ciudad,
    p.id_pedido,
    p.fecha_pedido,
    p.total,
    p.estado AS estado_pedido
FROM clientes AS c
LEFT JOIN pedidos AS p
    ON c.id_cliente = p.id_cliente
ORDER BY c.nombre ASC, p.fecha_pedido ASC;


-- 2. Mostrar todos los clientes y la cantidad de pedidos realizados.
-- Los clientes sin pedidos aparecen con cantidad 0.
SELECT
    c.id_cliente,
    c.nombre AS cliente,
    COUNT(p.id_pedido) AS total_pedidos
FROM clientes AS c
LEFT JOIN pedidos AS p
    ON c.id_cliente = p.id_cliente
GROUP BY c.id_cliente, c.nombre
ORDER BY total_pedidos DESC, cliente ASC;


-- 3. Identificar los clientes que todavía no han realizado pedidos.
SELECT
    c.id_cliente,
    c.nombre AS cliente,
    c.correo,
    c.ciudad
FROM clientes AS c
LEFT JOIN pedidos AS p
    ON c.id_cliente = p.id_cliente
WHERE p.id_pedido IS NULL
ORDER BY cliente ASC;


-- 4. Mostrar el total comprado por cada cliente.
-- Los clientes sin pedidos aparecen con total 0.
SELECT
    c.id_cliente,
    c.nombre AS cliente,
    COALESCE(SUM(p.total), 0) AS total_compras
FROM clientes AS c
LEFT JOIN pedidos AS p
    ON c.id_cliente = p.id_cliente
GROUP BY c.id_cliente, c.nombre
ORDER BY total_compras DESC;


-- 5. Mostrar clientes cuyo total de compras supera los 300.
SELECT
    c.id_cliente,
    c.nombre AS cliente,
    COALESCE(SUM(p.total), 0) AS total_compras
FROM clientes AS c
LEFT JOIN pedidos AS p
    ON c.id_cliente = p.id_cliente
GROUP BY c.id_cliente, c.nombre
HAVING total_compras > 300
ORDER BY total_compras DESC;


-- 6. Mostrar clientes activos incluyendo aquellos que todavía
-- no tienen pedidos.
SELECT
    c.nombre AS cliente,
    c.ciudad,
    c.estado AS estado_cliente,
    COUNT(p.id_pedido) AS total_pedidos
FROM clientes AS c
LEFT JOIN pedidos AS p
    ON c.id_cliente = p.id_cliente
WHERE c.estado = 'activo'
GROUP BY c.id_cliente, c.nombre, c.ciudad, c.estado
ORDER BY total_pedidos DESC, cliente ASC;


-- 7. Obtener el Top 5 de clientes según el valor total de sus pedidos.
SELECT
    c.nombre AS cliente,
    COUNT(p.id_pedido) AS total_pedidos,
    COALESCE(SUM(p.total), 0) AS total_compras
FROM clientes AS c
LEFT JOIN pedidos AS p
    ON c.id_cliente = p.id_cliente
GROUP BY c.id_cliente, c.nombre
ORDER BY total_compras DESC
LIMIT 5;