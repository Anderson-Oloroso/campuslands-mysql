USE campuslands_mysql;

INSERT INTO clientes (nombre, correo, ciudad, estado) VALUES
('Carlos Martinez', 'carlos.martinez@email.com', 'Ciudad de Guatemala', 'activo'),
('Ana Lopez', 'ana.lopez@email.com', 'Mixco', 'activo'),
('Diego Ramirez', 'diego.ramirez@email.com', 'Villa Nueva', 'activo'),
('Sofia Castillo', 'sofia.castillo@email.com', 'Guatemala', 'activo'),
('Mateo Hernandez', 'mateo.hernandez@email.com', 'Mixco', 'inactivo'),
('Valeria Gomez', 'valeria.gomez@email.com', 'Villa Canales', 'activo'),
('Daniel Perez', 'daniel.perez@email.com', 'Guatemala', 'activo'),
('Laura Morales', 'laura.morales@email.com', 'San Miguel Petapa', 'activo'),
('Andrea Torres', 'andrea.torres@email.com', 'Guatemala', 'activo'),
('Luis Mendoza', 'luis.mendoza@email.com', 'Mixco', 'activo');

INSERT INTO productos
(nombre, categoria, talla, precio, stock, estado) VALUES
('Camiseta Oversize Negra', 'camisetas', 'M', 85.00, 20, 'disponible'),
('Camiseta Basica Blanca', 'camisetas', 'L', 65.00, 30, 'disponible'),
('Pantalon Cargo Beige', 'pantalones', 'M', 180.00, 12, 'disponible'),
('Jeans Clasico Azul', 'pantalones', '32', 220.00, 8, 'disponible'),
('Sudadera Urbana Gris', 'sudaderas', 'L', 195.00, 10, 'disponible'),
('Chaqueta Denim', 'chaquetas', 'M', 280.00, 5, 'disponible'),
('Gorra Street Negra', 'accesorios', 'U', 75.00, 18, 'disponible'),
('Tenis Urbanos Blancos', 'calzado', '40', 350.00, 6, 'disponible'),
('Bufanda Urbana', 'accesorios', 'U', 55.00, 0, 'agotado'),
('Chaleco Deportivo', 'chalecos', 'L', 160.00, 7, 'disponible');

INSERT INTO pedidos
(id_cliente, fecha_pedido, estado) VALUES
(1, '2026-08-01', 'entregado'),
(2, '2026-08-02', 'enviado'),
(3, '2026-08-03', 'procesando'),
(4, '2026-08-04', 'entregado'),
(1, '2026-08-05', 'entregado'),
(6, '2026-08-06', 'pendiente'),
(7, '2026-08-07', 'entregado'),
(8, '2026-08-08', 'enviado');

INSERT INTO detalle_pedido
(id_pedido, id_producto, cantidad, precio_unitario) VALUES
(1, 1, 2, 85.00),
(1, 7, 1, 75.00),
(2, 3, 1, 180.00),
(2, 2, 2, 65.00),
(3, 5, 1, 195.00),
(3, 4, 1, 220.00),
(4, 6, 1, 280.00),
(4, 7, 2, 75.00),
(5, 8, 1, 350.00),
(6, 1, 1, 85.00),
(7, 3, 2, 180.00),
(7, 5, 1, 195.00),
(8, 2, 3, 65.00);