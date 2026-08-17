-- ============================================================
-- Ejercicio 016 - DML y transacciones
-- Base de datos: campuslands_mysql
-- ============================================================

USE campuslands_mysql;

-- ------------------------------------------------------------
-- Productos
-- ------------------------------------------------------------
INSERT INTO productos
    (nombre, categoria, precio, stock, estado)
VALUES
    ('Hamburguesa Clasica', 'hamburguesas', 18.50, 30, 'activo'),
    ('Hamburguesa BBQ', 'hamburguesas', 22.00, 25, 'activo'),
    ('Hot Dog Especial', 'hot dogs', 14.00, 20, 'activo'),
    ('Papas Fritas Grandes', 'acompañamientos', 9.50, 40, 'activo'),
    ('Nachos con Queso', 'acompañamientos', 12.00, 25, 'activo'),
    ('Alitas BBQ', 'alitas', 20.00, 18, 'activo'),
    ('Malteada de Chocolate', 'bebidas', 11.50, 15, 'activo'),
    ('Limonada Natural', 'bebidas', 7.00, 35, 'activo'),
    ('Hamburguesa Picante', 'hamburguesas', 21.50, 22, 'activo'),
    ('Brownie con Helado', 'postres', 13.00, 12, 'inactivo');

-- ------------------------------------------------------------
-- Pedidos iniciales
-- ------------------------------------------------------------
INSERT INTO pedidos
    (cliente, fecha_pedido, estado, total)
VALUES
    ('Laura Martinez', '2026-08-10 12:15:00', 'entregado', 46.50),
    ('Andres Lopez', '2026-08-10 13:05:00', 'entregado', 34.00),
    ('Camila Rodriguez', '2026-08-11 14:20:00', 'preparando', 51.50),
    ('Daniel Gomez', '2026-08-11 18:30:00', 'entregado', 40.00),
    ('Sofia Hernandez', '2026-08-12 19:10:00', 'pendiente', 31.00),
    ('Mateo Castillo', '2026-08-13 20:05:00', 'entregado', 58.00),
    ('Valentina Perez', '2026-08-14 13:40:00', 'cancelado', 22.00),
    ('Nicolas Ramirez', '2026-08-15 18:50:00', 'preparando', 43.50);

-- ------------------------------------------------------------
-- Detalles de pedidos iniciales
-- ------------------------------------------------------------
INSERT INTO detalle_pedido
    (id_pedido, id_producto, cantidad, precio_unitario)
VALUES
    (1, 1, 1, 18.50),
    (1, 4, 1, 9.50),
    (1, 7, 1, 11.50),
    (1, 8, 1, 7.00),

    (2, 3, 1, 14.00),
    (2, 4, 1, 9.50),
    (2, 8, 1, 7.00),

    (3, 2, 1, 22.00),
    (3, 6, 1, 20.00),
    (3, 8, 1, 7.00),
    (3, 4, 1, 9.50),

    (4, 6, 2, 20.00),

    (5, 9, 1, 21.50),
    (5, 8, 1, 7.00),
    (5, 4, 1, 9.50),

    (6, 2, 1, 22.00),
    (6, 6, 1, 20.00),
    (6, 7, 1, 11.50),
    (6, 8, 1, 7.00),

    (7, 2, 1, 22.00),

    (8, 1, 1, 18.50),
    (8, 5, 1, 12.00),
    (8, 8, 1, 7.00),
    (8, 4, 1, 9.50);

-- ============================================================
-- TRANSACCION 1
-- Registro de un nuevo pedido.
-- ============================================================

START TRANSACTION;

INSERT INTO pedidos
    (cliente, fecha_pedido, estado, total)
VALUES
    ('Carlos Velasco', '2026-08-17 17:00:00', 'preparando', 0.00);

SET @nuevo_pedido = LAST_INSERT_ID();

INSERT INTO detalle_pedido
    (id_pedido, id_producto, cantidad, precio_unitario)
VALUES
    (@nuevo_pedido, 1, 1, 18.50),
    (@nuevo_pedido, 4, 1, 9.50),
    (@nuevo_pedido, 7, 1, 11.50);

UPDATE pedidos
SET total = (
    SELECT SUM(cantidad * precio_unitario)
    FROM detalle_pedido
    WHERE id_pedido = @nuevo_pedido
)
WHERE id_pedido = @nuevo_pedido;

UPDATE productos
SET stock = stock - 1
WHERE id_producto = 1
  AND stock >= 1;

UPDATE productos
SET stock = stock - 1
WHERE id_producto = 4
  AND stock >= 1;

UPDATE productos
SET stock = stock - 1
WHERE id_producto = 7
  AND stock >= 1;

COMMIT;

-- ============================================================
-- TRANSACCION 2
-- Ejemplo de ROLLBACK.
-- El pedido de prueba no debe permanecer en la base de datos.
-- ============================================================

START TRANSACTION;

INSERT INTO pedidos
    (cliente, fecha_pedido, estado, total)
VALUES
    ('Cliente Prueba Rollback', '2026-08-17 17:10:00', 'pendiente', 15.00);

SET @pedido_rollback = LAST_INSERT_ID();

INSERT INTO detalle_pedido
    (id_pedido, id_producto, cantidad, precio_unitario)
VALUES
    (@pedido_rollback, 3, 1, 14.00);

ROLLBACK;