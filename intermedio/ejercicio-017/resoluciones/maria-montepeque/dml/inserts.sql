-- Datos de practica: catalogo y ventas de una tienda de ropa.
-- Los productos 4 (Pantalon Jogger Negro) y 7 (Chaqueta Impermeable)
-- se dejan sin ventas a proposito para practicar LEFT JOIN.
USE campuslands_mysql;

INSERT INTO productos_intermedio (nombre, categoria, precio) VALUES
('Camisa Oxford Blanca', 'camisa', 45.00),
('Camisa Casual a Cuadros', 'camisa', 39.90),
('Pantalon Chino Beige', 'pantalon', 55.00),
('Pantalon Jogger Negro', 'pantalon', 48.50),
('Vestido Floral Verano', 'vestido', 62.00),
('Chaqueta Denim Clasica', 'chaqueta', 75.00),
('Chaqueta Impermeable', 'chaqueta', 90.00),
('Cinturon de Cuero', 'accesorio', 25.00);

INSERT INTO ventas_intermedio (id_producto, cliente_nombre, cantidad) VALUES
(1, 'Laura Gomez', 2),
(1, 'Diego Perez', 1),
(2, 'Ana Torres', 3),
(3, 'Carlos Ruiz', 2),
(5, 'Laura Gomez', 1),
(6, 'Ana Torres', 1),
(8, 'Diego Perez', 4),
(8, 'Carlos Ruiz', 2);
