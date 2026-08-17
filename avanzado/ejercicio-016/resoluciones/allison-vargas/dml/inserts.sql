-- DML: Inserción inicial de catálogo y bloque transaccional de pedidos
USE campuslands_mysql;

-- Carga inicial de productos de comida urbana
INSERT INTO productos_urbano (nombre, categoria, precio, stock_disponible) VALUES
('Smash Burger Doble', 'hamburguesa', 8.50, 50),
('Tacos de Birria (3 uds)', 'tacos', 7.00, 40),
('Street Hot Dog Gigante', 'hot_dog', 5.50, 30),
('Papas Rústicas Trufadas', 'acompañamiento', 4.00, 60),
('Limonada Artesanal', 'bebida', 2.50, 100),
('Burger Vegana de Garbanzo', 'hamburguesa', 8.00, 25),
('Tacos al Pastor (3 uds)', 'tacos', 6.50, 45),
('Soda de la Casa', 'bebida', 2.00, 80);

-- TRANSACCIÓN 1: Procesamiento exitoso de pedido con descuento e inserción en lote
START TRANSACTION;

INSERT INTO pedidos_urbano (cliente_nombre, monto_total, estado_pedido) 
VALUES ('Carlos Mendoza', 16.50, 'procesado');

SET @pedido_id_1 = LAST_INSERT_ID();

INSERT INTO detalle_pedidos_urbano (pedido_id, producto_id, cantidad, precio_unitario) VALUES
(@pedido_id_1, 1, 1, 8.50), -- Smash Burger Doble
(@pedido_id_1, 4, 1, 4.00), -- Papas Rústicas
(@pedido_id_1, 5, 1, 2.50); -- Limonada

UPDATE productos_urbano SET stock_disponible = stock_disponible - 1 WHERE producto_id = 1;
UPDATE productos_urbano SET stock_disponible = stock_disponible - 1 WHERE producto_id = 4;
UPDATE productos_urbano SET stock_disponible = stock_disponible - 1 WHERE producto_id = 5;

COMMIT;

-- TRANSACCIÓN 2: Pedido de Tacos y Soda
START TRANSACTION;

INSERT INTO pedidos_urbano (cliente_nombre, monto_total, estado_pedido) 
VALUES ('Valeria Gómez', 15.50, 'procesado');

SET @pedido_id_2 = LAST_INSERT_ID();

INSERT INTO detalle_pedidos_urbano (pedido_id, producto_id, cantidad, precio_unitario) VALUES
(@pedido_id_2, 2, 2, 7.00), -- 2x Tacos de Birria
(@pedido_id_2, 8, 1, 2.00); -- Soda

UPDATE productos_urbano SET stock_disponible = stock_disponible - 2 WHERE producto_id = 2;
UPDATE productos_urbano SET stock_disponible = stock_disponible - 1 WHERE producto_id = 8;

COMMIT;
