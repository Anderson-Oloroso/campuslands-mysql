USE campuslands_mysql;

-- =========================================================
-- 1. Consultar el estado inicial de productos.
-- =========================================================

SELECT
    id_producto,
    nombre,
    stock,
    precio,
    estado
FROM productos
ORDER BY id_producto;

-- =========================================================
-- 2. Crear un pedido dentro de una transacción.
-- La operación confirma el pedido solamente si todos
-- los pasos terminan correctamente.
-- =========================================================

START TRANSACTION;

INSERT INTO pedidos (
    cliente,
    fecha_pedido,
    estado,
    total
)
VALUES (
    'Pedro Ramirez',
    NOW(),
    'pendiente',
    0
);

SET @nuevo_pedido = LAST_INSERT_ID();

INSERT INTO detalle_pedido (
    id_pedido,
    id_producto,
    cantidad,
    precio_unitario
)
SELECT
    @nuevo_pedido,
    id_producto,
    2,
    precio
FROM productos
WHERE id_producto = 1
  AND stock >= 2;

UPDATE productos
SET stock = stock - 2
WHERE id_producto = 1
  AND stock >= 2;

UPDATE pedidos
SET
    total = (
        SELECT COALESCE(SUM(cantidad * precio_unitario), 0)
        FROM detalle_pedido
        WHERE id_pedido = @nuevo_pedido
    ),
    estado = 'confirmado'
WHERE id_pedido = @nuevo_pedido;

COMMIT;

-- =========================================================
-- 3. Demostrar ROLLBACK.
-- El pedido temporal y su detalle no quedan guardados.
-- =========================================================

START TRANSACTION;

INSERT INTO pedidos (
    cliente,
    fecha_pedido,
    estado,
    total
)
VALUES (
    'Cliente Prueba Rollback',
    NOW(),
    'pendiente',
    0
);

SET @pedido_rollback = LAST_INSERT_ID();

INSERT INTO detalle_pedido (
    id_pedido,
    id_producto,
    cantidad,
    precio_unitario
)
VALUES (
    @pedido_rollback,
    1,
    5,
    25.00
);

UPDATE productos
SET stock = stock - 5
WHERE id_producto = 1;

ROLLBACK;

-- =========================================================
-- 4. Consultar pedidos y sus totales.
-- =========================================================

SELECT
    p.id_pedido,
    p.cliente,
    p.fecha_pedido,
    p.estado,
    p.total
FROM pedidos AS p
ORDER BY p.fecha_pedido;

-- =========================================================
-- 5. Calcular nuevamente el total de cada pedido
-- a partir de sus detalles.
-- =========================================================

SELECT
    p.id_pedido,
    p.cliente,
    p.estado,
    ROUND(
        COALESCE(SUM(dp.cantidad * dp.precio_unitario), 0),
        2
    ) AS total_calculado
FROM pedidos AS p
LEFT JOIN detalle_pedido AS dp
    ON p.id_pedido = dp.id_pedido
GROUP BY
    p.id_pedido,
    p.cliente,
    p.estado
ORDER BY p.id_pedido;

-- =========================================================
-- 6. Mostrar el stock actual después de las operaciones.
-- =========================================================

SELECT
    id_producto,
    nombre,
    stock,
    estado
FROM productos
ORDER BY stock ASC;