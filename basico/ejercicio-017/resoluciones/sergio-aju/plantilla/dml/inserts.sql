USE campuslands_mysql;

-- Inserción de 8 prendas de ropa con variedad de tipos de datos
INSERT INTO basico_ejercicio_017 (prenda, categoria, talla, color, precio, stock, estado) VALUES
('Camiseta Oversize Negra', 'Camisetas', 'L', 'Negro', 25.00, 15, 'activo'),
('Camiseta Basic Blanca', 'Camisetas', 'M', 'Blanco', 18.00, 20, 'activo'),
('Jeans Slim Fit', 'Pantalones', 'M', 'Azul', 45.00, 10, 'activo'),
('Chaqueta de Mezclilla', 'Chaquetas', 'L', 'Azul Oscuro', 65.00, 5, 'activo'),
('Hoodie Urbano Negro', 'Chaquetas', 'XL', 'Negro', 50.00, 8, 'activo'),
('Pantalon Cargo', 'Pantalones', 'S', 'Verde Olivo', 40.00, 0, 'agotado'),
('Short Deportivo', 'Deportiva', 'S', 'Gris', 22.00, 12, 'activo'),
('Vestido Casual', 'Vestidos', 'M', 'Rojo', 35.00, 0, 'descontinuado');
