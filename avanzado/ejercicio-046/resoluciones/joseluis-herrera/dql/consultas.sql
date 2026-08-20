USE campuslands_mysql;

START TRANSACTION;

INSERT INTO pedidos (
    cliente,
    estado
)
VALUES (
    'Jose Herrera',
    'confirmado'
);

SET @pedido_id = LAST_INSERT_ID();

INSERT INTO detalle_pedidos (
    id_pedido,
    id_producto,
    cantidad,
    precio_unitario
)
SELECT
    @pedido_id,
    id_producto,
    2,
    precio
FROM productos
WHERE id_producto = 2
  AND stock >= 2;

UPDATE productos
SET stock = stock - 2,
    estado = CASE
        WHEN stock - 2 = 0 THEN 'agotado'
        ELSE 'disponible'
    END
WHERE id_producto = 2
  AND stock >= 2;

INSERT INTO detalle_pedidos (
    id_pedido,
    id_producto,
    cantidad,
    precio_unitario
)
SELECT
    @pedido_id,
    id_producto,
    1,
    precio
FROM productos
WHERE id_producto = 6
  AND stock >= 1;

UPDATE productos
SET stock = stock - 1,
    estado = CASE
        WHEN stock - 1 = 0 THEN 'agotado'
        ELSE 'disponible'
    END
WHERE id_producto = 6
  AND stock >= 1;

COMMIT;

SELECT
    p.id_pedido,
    p.cliente,
    p.fecha_pedido,
    p.estado,
    SUM(dp.cantidad * dp.precio_unitario) AS total_pedido
FROM pedidos AS p
INNER JOIN detalle_pedidos AS dp
    ON p.id_pedido = dp.id_pedido
GROUP BY
    p.id_pedido,
    p.cliente,
    p.fecha_pedido,
    p.estado
ORDER BY p.id_pedido DESC;

SELECT
    pr.nombre AS producto,
    pr.categoria,
    pr.stock,
    pr.estado
FROM productos AS pr
ORDER BY pr.stock ASC;

SELECT
    p.cliente,
    pr.nombre AS producto,
    dp.cantidad,
    dp.precio_unitario,
    dp.cantidad * dp.precio_unitario AS subtotal
FROM pedidos AS p
INNER JOIN detalle_pedidos AS dp
    ON p.id_pedido = dp.id_pedido
INNER JOIN productos AS pr
    ON dp.id_producto = pr.id_producto
ORDER BY p.id_pedido DESC, pr.nombre;

SELECT
    pr.categoria,
    COUNT(dp.id_detalle) AS productos_vendidos,
    SUM(dp.cantidad) AS unidades_vendidas,
    ROUND(SUM(dp.cantidad * dp.precio_unitario), 2) AS ingresos
FROM productos AS pr
INNER JOIN detalle_pedidos AS dp
    ON pr.id_producto = dp.id_producto
GROUP BY pr.categoria
ORDER BY ingresos DESC;

SELECT
    pr.nombre AS producto,
    pr.stock
FROM productos AS pr
WHERE pr.stock < 10
ORDER BY pr.stock ASC;