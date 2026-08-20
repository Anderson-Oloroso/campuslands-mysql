USE campuslands_mysql;

-- Insertar categorías
INSERT INTO categorias (nombre_categoria) VALUES
('Camisetas'), ('Pantalones'), ('Chaquetas'), ('Accesorios');

-- Insertar productos (algunos sin categoría para probar LEFT JOIN)
INSERT INTO productos (categoria_id, nombre_producto, precio_unidad, stock, estado_venta) VALUES
(1, 'Camiseta básica blanca', 15.00, 100, 'disponible'),
(1, 'Camiseta estampada', 20.00, 50, 'disponible'),
(2, 'Jeans Slim Fit', 45.00, 30, 'disponible'),
(3, 'Chaqueta de cuero', 120.00, 10, 'disponible'),
(NULL, 'Calcetines sorpresa', 5.00, 200, 'disponible'), -- Sin categoria
(NULL, 'Parche vintage', 3.00, 50, 'disponible'),     -- Sin categoría
(4, 'Gorra urbana', 12.00, 40, 'disponible'),
(4, 'Bufanda de lana', 25.00, 15, 'disponible');