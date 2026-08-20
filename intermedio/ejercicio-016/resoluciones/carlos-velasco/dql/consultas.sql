USE campuslands_mysql;


-- ============================================================
-- CONSULTA 1
-- Mostrar los pedidos junto con el cliente y el plato solicitado.
-- ============================================================

SELECT
    p.id_pedido,
    c.nombre AS cliente,
    pl.nombre AS plato,
    p.cantidad,
    p.estado,
    p.fecha_pedido
FROM pedidos AS p
INNER JOIN clientes AS c
    ON p.id_cliente = c.id_cliente
INNER JOIN platos AS pl
    ON p.id_plato = pl.id_plato
ORDER BY p.fecha_pedido;


-- ============================================================
-- CONSULTA 2
-- Mostrar pedidos entregados con su valor total.
-- ============================================================

SELECT
    p.id_pedido,
    c.nombre AS cliente,
    pl.nombre AS plato,
    p.cantidad,
    pl.precio,
    ROUND(p.cantidad * pl.precio, 2) AS total_pedido
FROM pedidos AS p
INNER JOIN clientes AS c
    ON p.id_cliente = c.id_cliente
INNER JOIN platos AS pl
    ON p.id_plato = pl.id_plato
WHERE p.estado = 'entregado'
ORDER BY total_pedido DESC;


-- ============================================================
-- CONSULTA 3
-- Mostrar los pedidos realizados por clientes activos.
-- ============================================================

SELECT
    c.nombre AS cliente,
    pl.nombre AS plato,
    p.cantidad,
    p.estado,
    p.fecha_pedido
FROM pedidos AS p
INNER JOIN clientes AS c
    ON p.id_cliente = c.id_cliente
INNER JOIN platos AS pl
    ON p.id_plato = pl.id_plato
WHERE c.estado = 'activo'
ORDER BY p.fecha_pedido DESC;


-- ============================================================
-- CONSULTA 4
-- Calcular cuanto ha generado cada cliente en pedidos
-- entregados.
-- ============================================================

SELECT
    c.id_cliente,
    c.nombre AS cliente,
    COUNT(p.id_pedido) AS cantidad_pedidos,
    ROUND(
        SUM(p.cantidad * pl.precio),
        2
    ) AS total_gastado
FROM clientes AS c
INNER JOIN pedidos AS p
    ON c.id_cliente = p.id_cliente
INNER JOIN platos AS pl
    ON p.id_plato = pl.id_plato
WHERE p.estado = 'entregado'
GROUP BY
    c.id_cliente,
    c.nombre
ORDER BY total_gastado DESC;


-- ============================================================
-- CONSULTA 5
-- Obtener los platos que han sido pedidos y la cantidad total
-- de unidades solicitadas.
-- ============================================================

SELECT
    pl.nombre AS plato,
    pl.categoria,
    SUM(p.cantidad) AS unidades_pedidas
FROM platos AS pl
INNER JOIN pedidos AS p
    ON pl.id_plato = p.id_plato
GROUP BY
    pl.id_plato,
    pl.nombre,
    pl.categoria
ORDER BY unidades_pedidas DESC;


-- ============================================================
-- CONSULTA 6
-- Mostrar los pedidos cuyo valor supera los 50.
-- ============================================================

SELECT
    p.id_pedido,
    c.nombre AS cliente,
    pl.nombre AS plato,
    p.cantidad,
    ROUND(p.cantidad * pl.precio, 2) AS total_pedido,
    p.estado
FROM pedidos AS p
INNER JOIN clientes AS c
    ON p.id_cliente = c.id_cliente
INNER JOIN platos AS pl
    ON p.id_plato = pl.id_plato
WHERE p.cantidad * pl.precio > 50
ORDER BY total_pedido DESC;


-- ============================================================
-- CONSULTA 7
-- Ranking de clientes segun cantidad de pedidos entregados.
-- ============================================================

SELECT
    c.nombre AS cliente,
    COUNT(p.id_pedido) AS pedidos_entregados,
    SUM(p.cantidad) AS unidades_compradas
FROM clientes AS c
INNER JOIN pedidos AS p
    ON c.id_cliente = p.id_cliente
WHERE p.estado = 'entregado'
GROUP BY
    c.id_cliente,
    c.nombre
ORDER BY pedidos_entregados DESC, unidades_compradas DESC;