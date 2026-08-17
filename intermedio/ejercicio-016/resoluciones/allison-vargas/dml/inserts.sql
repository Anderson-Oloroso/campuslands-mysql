-- DML: Registro de clientes, platillos y órdenes asociadas
USE campuslands_mysql;

INSERT INTO clientes_urbano (nombre, telefono, tipo_cliente) VALUES
('Carlos Mendoza', '555-0192', 'vip'),
('Valeria Gómez', '555-0183', 'frecuente'),
('Mateo Fernández', '555-0174', 'nuevo'),
('Sofia López', '555-0165', 'frecuente');

INSERT INTO platillos_urbano (nombre, categoria, precio) VALUES
('Smash Burger Doble', 'hamburguesa', 8.50),
('Tacos de Birria', 'tacos', 7.00),
('Street Hot Dog Gigante', 'hot_dog', 5.50),
('Papas Rústicas Trufadas', 'acompañamiento', 4.00),
('Limonada Artesanal', 'bebida', 2.50);

INSERT INTO pedidos_urbano_join (cliente_id, platillo_id, cantidad, fecha_pedido) VALUES
(1, 1, 2, '2026-07-20 12:30:00'),
(1, 4, 1, '2026-07-20 12:30:00'),
(2, 2, 3, '2026-07-20 13:15:00'),
(2, 5, 2, '2026-07-20 13:15:00'),
(3, 3, 1, '2026-07-21 18:45:00'),
(3, 4, 1, '2026-07-21 18:45:00'),
(4, 1, 1, '2026-07-22 20:00:00'),
(4, 5, 1, '2026-07-22 20:00:00');
