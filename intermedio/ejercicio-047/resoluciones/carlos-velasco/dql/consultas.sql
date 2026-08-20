USE campuslands_mysql;

-- 1. Mostrar todos los clientes y sus pedidos.
-- Los clientes sin pedidos también deben aparecer.
SELECT
    c.id_cliente,
    c.nombre AS cliente,
    c.ciudad,
    p.id_pedido,
    p.fecha_pedido,
    p.estado AS estado_pedido
FROM clientes AS c
LEFT JOIN pedidos AS p
    ON c.id_cliente = p.id_cliente
ORDER BY c.nombre, p.fecha_pedido;


-- 2. Identificar clientes que todavía no tienen pedidos.
SELECT
    c.id_cliente,
    c.nombre AS cliente,
    c.correo,
    c.ciudad
FROM clientes AS c
LEFT JOIN pedidos AS p
    ON c.id_cliente = p.id_cliente
WHERE p.id_pedido IS NULL
ORDER BY c.nombre;


-- 3. Mostrar todos los productos y los pedidos en los que aparecen.
-- Los productos que nunca han sido vendidos también aparecen.
SELECT
    pr.id_producto,
    pr.nombre AS producto,
    pr.categoria,
    dp.id_pedido,
    dp.cantidad,
    dp.precio_unitario
FROM productos AS pr
LEFT JOIN detalle_pedido AS dp
    ON pr.id_producto = dp.id_producto
ORDER BY pr.nombre, dp.id_pedido;


-- 4. Identificar productos que nunca han sido vendidos.
SELECT
    pr.id_producto,
    pr.nombre AS producto,
    pr.categoria,
    pr.stock,
    pr.estado
FROM productos AS pr
LEFT JOIN detalle_pedido AS dp
    ON pr.id_producto = dp.id_producto
WHERE dp.id_detalle IS NULL
ORDER BY pr.nombre;


-- 5. Contar cuántos pedidos tiene cada cliente.
-- Los clientes sin pedidos aparecen con total 0.
SELECT
    c.id_cliente,
    c.nombre AS cliente,
    COUNT(p.id_pedido) AS total_pedidos
FROM clientes AS c
LEFT JOIN pedidos AS p
    ON c.id_cliente = p.id_cliente
GROUP BY c.id_cliente, c.nombre
ORDER BY total_pedidos DESC, cliente ASC;


-- 6. Calcular el valor comprado por cada cliente.
-- Los clientes sin pedidos aparecen con gasto 0.
SELECT
    c.id_cliente,
    c.nombre AS cliente,
    COALESCE(
        SUM(dp.cantidad * dp.precio_unitario),
        0
    ) AS gasto_total
FROM clientes AS c
LEFT JOIN pedidos AS p
    ON c.id_cliente = p.id_cliente
LEFT JOIN detalle_pedido AS dp
    ON p.id_pedido = dp.id_pedido
GROUP BY c.id_cliente, c.nombre
ORDER BY gasto_total DESC;


-- 7. Mostrar todos los productos con su cantidad total vendida.
-- Los productos sin ventas aparecen con cantidad 0.
SELECT
    pr.id_producto,
    pr.nombre AS producto,
    pr.categoria,
    COALESCE(SUM(dp.cantidad), 0) AS unidades_vendidas
FROM productos AS pr
LEFT JOIN detalle_pedido AS dp
    ON pr.id_producto = dp.id_producto
GROUP BY pr.id_producto, pr.nombre, pr.categoria
ORDER BY unidades_vendidas DESC, producto ASC;


-- 8. Mostrar clientes activos que no han realizado ningún pedido.
SELECT
    c.id_cliente,
    c.nombre AS cliente,
    c.correo,
    c.ciudad
FROM clientes AS c
LEFT JOIN pedidos AS p
    ON c.id_cliente = p.id_cliente
WHERE c.estado = 'activo'
  AND p.id_pedido IS NULL
ORDER BY c.nombre;