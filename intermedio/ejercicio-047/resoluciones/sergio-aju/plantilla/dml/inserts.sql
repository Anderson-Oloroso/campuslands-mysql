USE campuslands_mysql;

-- Inserción de Clientes (Incluso clientes que aún no han comprado)
INSERT INTO clientes (nombre, apellido, email, fecha_registro) VALUES
('Carlos', 'Mendoza', 'carlos.mendoza@email.com', '2026-01-10'),
('Valeria', 'Silva', 'valeria.silva@email.com', '2026-02-15'),
('Diego', 'Arriola', 'diego.arriola@email.com', '2026-03-01'),
('Sofía', 'Ramírez', 'sofia.ramirez@email.com', '2026-04-12'),
('Kenia', 'Rosales', 'kenia.rosales@email.com', '2026-05-20'); -- Cliente sin ventas registradas

-- Inserción de Categorías
INSERT INTO categorias (nombre) VALUES
('Chumpas y Chaquetas'),
('Pantalones y Jeans'),
('Camisetas y Tops'),
('Accesorios y Gorras'); -- Categoría sin prendas registradas aún

-- Inserción de Prendas de vestir (Incluye prendas con stock pero sin ventas)
INSERT INTO prendas (categoria_id, nombre, talla, color, precio, stock) VALUES
(1, 'Chumpa Oversize Cyberpunk Black', 'L', 'Negro', 350.00, 15),
(1, 'Chumpa Cuero Sintético Biker', 'M', 'Negro', 420.00, 8),
(2, 'Jeans Cargo Slim Fit', '32', 'Negro', 280.00, 20),
(2, 'Pantalón Jogger Urbano', 'M', 'Gris', 195.00, 12),
(3, 'Camiseta Essential Black Cotton', 'S', 'Negro', 110.00, 50),
(3, 'Camiseta Graphic Print Rock', 'XL', 'Blanco', 135.00, 25),
(1, 'Chumpa Rompevientos Reflectiva', 'S', 'Azul', 260.00, 10); -- Prenda sin ventas

-- Inserción de Ventas registradas
INSERT INTO ventas (cliente_id, fecha_venta, total) VALUES
(1, '2026-06-01 10:30:00', 460.00),
(2, '2026-06-02 14:15:00', 420.00),
(3, '2026-06-03 16:45:00', 245.00),
(1, '2026-06-05 11:00:00', 280.00);

-- Detalle de las Ventas
INSERT INTO detalle_ventas (venta_id, prenda_id, cantidad, precio_unitario) VALUES
(1, 1, 1, 350.00), -- Chumpa Oversize Black
(1, 5, 1, 110.00), -- Camiseta Cotton
(2, 2, 1, 420.00), -- Chumpa Cuero
(3, 6, 1, 135.00), -- Camiseta Graphic
(3, 5, 1, 110.00), -- Camiseta Cotton
(4, 3, 1, 280.00); -- Jeans Cargo