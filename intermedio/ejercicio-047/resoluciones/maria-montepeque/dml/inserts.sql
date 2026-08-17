-- Datos de practica: productos y ventas de una tienda de ropa.
-- "Chaqueta de Cuero" y "Pantalon Cargo" se dejan sin ninguna venta
-- a proposito, para practicar LEFT JOIN.
USE campuslands_mysql;

INSERT INTO productos_intermedio (nombre, categoria) VALUES
('Camiseta Basica Blanca', 'camisetas'),
('Jean Slim Azul', 'pantalones'),
('Vestido Floral Verano', 'vestidos'),
('Chaqueta de Cuero', 'chaquetas'),
('Tenis Urbanos Negros', 'calzado'),
('Pantalon Cargo', 'pantalones');

INSERT INTO ventas_intermedio (id_producto, cantidad, precio_unitario, fecha) VALUES
(1, 3, 35000.00, '2026-01-05 20:00:00'),
(1, 2, 35000.00, '2026-01-10 21:00:00'),
(2, 1, 89000.00, '2026-01-06 19:30:00'),
(2, 4, 85000.00, '2026-01-12 22:00:00'),
(3, 2, 120000.00, '2026-01-07 20:15:00'),
(5, 5, 175000.00, '2026-01-08 18:45:00'),
(5, 1, 175000.00, '2026-01-15 19:00:00'),
(3, 1, 115000.00, '2026-01-16 21:30:00'),
(1, 4, 32000.00, '2026-02-01 20:00:00');
