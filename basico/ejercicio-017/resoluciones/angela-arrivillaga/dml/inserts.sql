USE tienda_ropa_db;

INSERT INTO categorias_ropa (nombre_categoria, descripcion_categoria) VALUES
('Superior', 'Camisas, blusas, suéteres y chaquetas'),
('Inferior', 'Pantalones, jeans, faldas yshorts'),
('Calzado', 'Tenis, zapatos formales y botas'),
('Accesorios', 'Gorras, cinturones, bolsos y joyería');

INSERT INTO productos_ropa (nombre_articulo, id_categoria, talla, precio_unitario, stock_actual, fecha_ingreso, estado_disponibilidad) VALUES
('Hoodie Oversize Neon', 1, 'L', 45.99, 25, '2026-05-10', 'disponible'),
('Jeans Coquette Estilo Recto', 2, 'M', 59.50, 14, '2026-06-01', 'en_oferta'),
('Tenis Platform Retro', 3, '38', 89.99, 8, '2026-04-15', 'disponible'),
('Camiseta Basica Algodon', 1, 'S', 19.99, 50, '2026-07-01', 'disponible'),
('Chaqueta de Cuero Sintetico', 1, 'M', 119.00, 3, '2026-03-20', 'agotado'),
('Short Tiro Alto Denim', 2, 'S', 29.90, 30, '2026-06-12', 'disponible'),
('Bolso Crossbody Minimalista', 4, 'Unica', 35.50, 12, '2026-05-25', 'en_oferta'),
('Gorra Urbana Snapback', 4, 'Unica', 22.00, 0, '2026-02-10', 'descontinuado');