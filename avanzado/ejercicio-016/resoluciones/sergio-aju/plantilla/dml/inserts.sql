USE campuslands_mysql;

-- Inserción de Productos (8 registros)
INSERT INTO productos (id, nombre, precio, stock, estado) VALUES
(1, 'Burger Smash Doble', 45.00, 20, 'activo'),
(2, 'Burger Crispy Chicken', 42.00, 15, 'activo'),
(3, 'Tacos de Birria', 38.00, 30, 'activo'),
(4, 'Tacos al Pastor', 35.00, 25, 'activo'),
(5, 'Hot Dog XL Monster', 28.00, 10, 'activo'),
(6, 'Papas Callejeras', 22.00, 40, 'activo'),
(7, 'Limonada Menta', 12.00, 50, 'activo'),
(8, 'Cerveza Artesanal', 25.00, 18, 'activo');

-- EJEMPLO 1: Transacción Exitosa (COMMIT)
-- Registra un pedido completo y descuenta el stock
START TRANSACTION;

INSERT INTO pedidos (id, cliente, total, estado) VALUES (1, 'Carlos Gomez', 97.00, 'completado');

INSERT INTO detalle_pedidos (pedido_id, producto_id, cantidad, subtotal) VALUES 
(1, 1, 1, 45.00), -- 1 Burger Smash
(1, 6, 1, 22.00), -- 1 Papas Callejeras
(1, 8, 1, 25.00); -- 1 Cerveza

UPDATE productos SET stock = stock - 1 WHERE id = 1;
UPDATE productos SET stock = stock - 1 WHERE id = 6;
UPDATE productos SET stock = stock - 1 WHERE id = 8;

COMMIT;


-- EJEMPLO 2: Transacción con Fallo / Cancelación (ROLLBACK)
-- Simula un pedido que se cancela antes de guardar cambios definitivos
START TRANSACTION;

INSERT INTO pedidos (id, cliente, total, estado) VALUES (2, 'Maria Lopez', 76.00, 'cancelado');

INSERT INTO detalle_pedidos (pedido_id, producto_id, cantidad, subtotal) VALUES 
(2, 3, 2, 76.00); -- 2 Tacos de Birria

-- Ocurre un problema o el cliente cancela, se deshacen los cambios
ROLLBACK;


-- Insertar un segundo pedido exitoso para tener suficientes datos
START TRANSACTION;

INSERT INTO pedidos (id, cliente, total, estado) VALUES (2, 'Ana Martinez', 80.00, 'completado');

INSERT INTO detalle_pedidos (pedido_id, producto_id, cantidad, subtotal) VALUES 
(2, 2, 1, 42.00), -- 1 Burger Crispy
(2, 3, 1, 38.00); -- 1 Tacos Birria

UPDATE productos SET stock = stock - 1 WHERE id = 2;
UPDATE productos SET stock = stock - 1 WHERE id = 3;

COMMIT;