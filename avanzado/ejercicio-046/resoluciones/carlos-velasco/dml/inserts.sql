USE campuslands_mysql;

INSERT INTO productos
(nombre, categoria, precio, stock, estado)
VALUES
('Hamburguesa Clasica', 'Hamburguesas', 25.00, 20, 'disponible'),
('Hamburguesa BBQ', 'Hamburguesas', 32.00, 15, 'disponible'),
('Papas Fritas', 'Acompanamientos', 12.00, 30, 'disponible'),
('Hot Dog Especial', 'Hot Dogs', 22.00, 18, 'disponible'),
('Tacos Urbanos', 'Tacos', 28.00, 12, 'disponible'),
('Alitas Picantes', 'Alitas', 35.00, 10, 'disponible'),
('Limonada Natural', 'Bebidas', 10.00, 25, 'disponible'),
('Batido de Fresa', 'Bebidas', 15.00, 8, 'disponible');

INSERT INTO pedidos
(cliente, fecha_pedido, estado, total)
VALUES
('Carlos Lopez', '2026-08-15 12:30:00', 'confirmado', 0),
('Maria Gonzalez', '2026-08-15 13:15:00', 'confirmado', 0),
('Juan Perez', '2026-08-16 18:20:00', 'pendiente', 0),
('Ana Morales', '2026-08-16 19:05:00', 'pendiente', 0);

INSERT INTO detalle_pedido
(id_pedido, id_producto, cantidad, precio_unitario)
VALUES
(1, 1, 2, 25.00),
(1, 3, 1, 12.00),
(1, 7, 2, 10.00),

(2, 2, 1, 32.00),
(2, 6, 1, 35.00),
(2, 8, 1, 15.00),

(3, 5, 2, 28.00),
(3, 7, 1, 10.00),

(4, 4, 2, 22.00),
(4, 3, 1, 12.00);