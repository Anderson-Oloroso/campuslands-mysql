-- Carga inicial de datos para pruebas
USE campuslands_mysql;

-- Inserción de Clientes
INSERT INTO clientes (nombre, telefono, saldo_puntos) VALUES
('Carlos Mendoza', '555-0101', 120),
('Ana Lucía Torres', '555-0102', 45),
('Sofía Ramírez', '555-0103', 200),
('Diego Gómez', '555-0104', 0);

-- Inserción de Productos
INSERT INTO productos (nombre, categoria, precio, stock, estado) VALUES
('Burger Doble Smash Bacon', 'Hamburguesas', 45.00, 15, 'disponible'),
('Burger Clásica Cheddar', 'Hamburguesas', 35.00, 20, 'disponible'),
('Hot Dog Callejero XXL', 'Hot Dogs', 28.00, 10, 'disponible'),
('Tacos de Birria con Consomé', 'Tacos', 40.00, 8, 'disponible'),
('Papas Loaded Pulled Pork', 'Acompañamientos', 30.00, 25, 'disponible'),
('Malteada Oreo & Nutella', 'Bebidas', 25.00, 12, 'disponible'),
('Soda Artesanal Maracuyá', 'Bebidas', 15.00, 30, 'disponible'),
('Empanada Vegana Especial', 'Especiales', 18.00, 0, 'agotado');

-- Inserción de Pedidos previos para reportes
INSERT INTO pedidos (cliente_id, total, estado) VALUES
(1, 75.00, 'completado'),
(2, 68.00, 'completado'),
(3, 40.00, 'completado');

INSERT INTO detalle_pedidos (pedido_id, producto_id, cantidad, precio_unitario) VALUES
(1, 1, 1, 45.00),
(1, 5, 1, 30.00),
(2, 2, 1, 35.00),
(2, 3, 1, 28.00),
(3, 4, 1, 40.00);