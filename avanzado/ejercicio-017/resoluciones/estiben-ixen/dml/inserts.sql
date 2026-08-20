-- Insercion de datos para tienda de ropa (ejercicio-017)
USE campuslands_mysql;

-- Insercion en marcas_ropa
INSERT INTO marcas_ropa (nombre_marca, pais_origen, segmento) VALUES
('Nike Athletic', 'Estados Unidos', 'Deportivo'),
('Zara Urban', 'Espana', 'Casual'),
('Off-White Co', 'Italia', 'Streetwear'),
('Hugo Boss', 'Alemania', 'Formal'),
('Patagonia Outdoor', 'Estados Unidos', 'Casual'),
('Stussy Apparel', 'Estados Unidos', 'Streetwear');

-- Insercion en prendas_vestir
INSERT INTO prendas_vestir (nombre_articulo, id_marca, talla, color, genero, precio, stock_disponible) VALUES
('Hoodie Tech Fleece', 1, 'L', 'Gris Jaspeado', 'Hombre', 110.00, 45),
('Running Shorts Dri-Fit', 1, 'M', 'Negro', 'Mujer', 45.00, 60),
('Chaqueta Blazer Slim Fit', 2, 'M', 'Azul Marino', 'Hombre', 89.90, 25),
('Vestido Midi Satinado', 2, 'S', 'Esmeralda', 'Mujer', 65.00, 30),
('Arrows Oversized T-Shirt', 3, 'XL', 'Blanco', 'Unisex', 280.00, 12),
('Industrial Cargo Pants', 3, 'L', 'Negro', 'Hombre', 420.00, 8),
('Camisa Formal Algodon Egipcio', 4, 'M', 'Blanco', 'Hombre', 140.00, 20),
('Traje Completo Lana Virgen', 4, 'L', 'Gris Marengo', 'Hombre', 650.00, 5),
('Chaqueta Retro Pile Fleece', 5, 'M', 'Beige', 'Unisex', 150.00, 35),
('Down Sweater Jacket', 5, 'L', 'Verde Oliva', 'Hombre', 220.00, 18),
('8-Ball Graphic Tee', 6, 'L', 'Negro', 'Unisex', 55.00, 50),
('Basic Stussy Sweatpant', 6, 'M', 'Gris', 'Unisex', 125.00, 22);

