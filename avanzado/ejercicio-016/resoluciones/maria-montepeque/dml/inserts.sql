-- Datos de practica: inventario y transacciones de un restaurante de comida urbana.
USE campuslands_mysql;

-- Inventario inicial de ingredientes
INSERT INTO ingredientes_avanzado (nombre, unidad_medida, stock_actual, stock_minimo) VALUES
('Pan de hamburguesa', 'unidad', 40, 10),
('Carne de res', 'kg', 15, 5),
('Tortilla de maiz', 'unidad', 100, 20),
('Carne al pastor', 'kg', 8, 3),
('Queso cheddar', 'kg', 6, 2),
('Limon', 'kg', 10, 3),
('Coco', 'unidad', 12, 4),
('Papa', 'kg', 25, 8);

-- ===================================================================
-- Transaccion 1: pedido exitoso de Laura (2 burgers) -> COMMIT
-- Descuenta pan y carne de res, registra el pedido y sus movimientos.
-- ===================================================================
START TRANSACTION;

INSERT INTO pedidos_avanzado (cliente_nombre, total, estado)
VALUES ('Laura Gomez', 65.00, 'confirmado');

SET @id_pedido_1 = LAST_INSERT_ID();

UPDATE ingredientes_avanzado
SET stock_actual = stock_actual - 2
WHERE nombre = 'Pan de hamburguesa';

INSERT INTO movimientos_inventario_avanzado (id_ingrediente, id_pedido, tipo, cantidad)
SELECT id_ingrediente, @id_pedido_1, 'salida', 2
FROM ingredientes_avanzado WHERE nombre = 'Pan de hamburguesa';

UPDATE ingredientes_avanzado
SET stock_actual = stock_actual - 1
WHERE nombre = 'Carne de res';

INSERT INTO movimientos_inventario_avanzado (id_ingrediente, id_pedido, tipo, cantidad)
SELECT id_ingrediente, @id_pedido_1, 'salida', 1
FROM ingredientes_avanzado WHERE nombre = 'Carne de res';

COMMIT;

-- ===================================================================
-- Transaccion 2: pedido de Carlos con SAVEPOINT
-- Se confirman 3 tacos (tortilla + carne al pastor) y luego el cliente
-- se arrepiente del postre: se revierte solo ese movimiento con
-- ROLLBACK TO SAVEPOINT, conservando los tacos ya aplicados.
-- ===================================================================
START TRANSACTION;

INSERT INTO pedidos_avanzado (cliente_nombre, total, estado)
VALUES ('Carlos Ruiz', 54.00, 'confirmado');

SET @id_pedido_2 = LAST_INSERT_ID();

UPDATE ingredientes_avanzado
SET stock_actual = stock_actual - 3
WHERE nombre = 'Tortilla de maiz';

INSERT INTO movimientos_inventario_avanzado (id_ingrediente, id_pedido, tipo, cantidad)
SELECT id_ingrediente, @id_pedido_2, 'salida', 3
FROM ingredientes_avanzado WHERE nombre = 'Tortilla de maiz';

UPDATE ingredientes_avanzado
SET stock_actual = stock_actual - 1
WHERE nombre = 'Carne al pastor';

INSERT INTO movimientos_inventario_avanzado (id_ingrediente, id_pedido, tipo, cantidad)
SELECT id_ingrediente, @id_pedido_2, 'salida', 1
FROM ingredientes_avanzado WHERE nombre = 'Carne al pastor';

SAVEPOINT antes_de_postre;

UPDATE ingredientes_avanzado
SET stock_actual = stock_actual - 1
WHERE nombre = 'Coco';

INSERT INTO movimientos_inventario_avanzado (id_ingrediente, id_pedido, tipo, cantidad)
SELECT id_ingrediente, @id_pedido_2, 'salida', 1
FROM ingredientes_avanzado WHERE nombre = 'Coco';

-- El cliente decide no llevar el postre: se deshace solo este tramo.
ROLLBACK TO SAVEPOINT antes_de_postre;

COMMIT;

-- ===================================================================
-- Transaccion 3: pedido de Ana cancelado antes de confirmar -> ROLLBACK
-- El cliente se arrepiente del pedido completo; ningun cambio se guarda.
-- ===================================================================
START TRANSACTION;

INSERT INTO pedidos_avanzado (cliente_nombre, total, estado)
VALUES ('Ana Torres', 22.00, 'confirmado');

SET @id_pedido_3 = LAST_INSERT_ID();

UPDATE ingredientes_avanzado
SET stock_actual = stock_actual - 5
WHERE nombre = 'Papa';

INSERT INTO movimientos_inventario_avanzado (id_ingrediente, id_pedido, tipo, cantidad)
SELECT id_ingrediente, @id_pedido_3, 'salida', 5
FROM ingredientes_avanzado WHERE nombre = 'Papa';

ROLLBACK;
