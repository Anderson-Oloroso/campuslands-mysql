USE campuslands_mysql;

INSERT INTO clientes (nombre, telefono, ciudad, estado) VALUES
('Carlos Martinez', '55510001', 'Ciudad de Guatemala', 'activo'),
('Ana Lopez', '55510002', 'Mixco', 'activo'),
('Diego Ramirez', '55510003', 'Villa Nueva', 'activo'),
('Sofia Castillo', '55510004', 'Guatemala', 'activo'),
('Mateo Hernandez', '55510005', 'Mixco', 'inactivo'),
('Valeria Gomez', '55510006', 'Villa Canales', 'activo'),
('Daniel Perez', '55510007', 'Guatemala', 'activo'),
('Laura Morales', '55510008', 'San Miguel Petapa', 'activo');

INSERT INTO productos (nombre, categoria, precio, estado) VALUES
('Hamburguesa Clasica', 'hamburguesas', 35.00, 'disponible'),
('Hamburguesa BBQ', 'hamburguesas', 42.00, 'disponible'),
('Hot Dog Especial', 'hot dogs', 28.00, 'disponible'),
('Papas Cargadas', 'acompanamientos', 25.00, 'disponible'),
('Alitas Picantes', 'alitas', 45.00, 'disponible'),
('Nachos Urbanos', 'acompanamientos', 32.00, 'disponible'),
('Limonada Natural', 'bebidas', 15.00, 'disponible'),
('Batido de Fresa', 'bebidas', 22.00, 'agotado');

INSERT INTO pedidos (id_cliente, fecha_pedido, estado) VALUES
(1, '2026-08-01', 'entregado'),
(2, '2026-08-02', 'entregado'),
(3, '2026-08-03', 'preparando'),
(4, '2026-08-04', 'entregado'),
(1, '2026-08-05', 'pendiente'),
(6, '2026-08-06', 'entregado'),
(7, '2026-08-07', 'entregado'),
(8, '2026-08-08', 'preparando');

INSERT INTO detalle_pedido
(id_pedido, id_producto, cantidad, precio_unitario) VALUES
(1, 1, 2, 35.00),
(1, 7, 2, 15.00),
(2, 2, 1, 42.00),
(2, 4, 1, 25.00),
(3, 5, 2, 45.00),
(3, 7, 1, 15.00),
(4, 3, 2, 28.00),
(4, 6, 1, 32.00),
(5, 1, 1, 35.00),
(6, 2, 2, 42.00),
(6, 4, 1, 25.00),
(7, 5, 1, 45.00),
(7, 7, 2, 15.00),
(8, 6, 2, 32.00);