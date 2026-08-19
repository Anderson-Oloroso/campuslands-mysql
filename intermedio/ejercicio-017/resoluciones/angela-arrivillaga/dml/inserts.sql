USE tienda_ropa_db;

INSERT INTO categorias_ropa (nombre_categoria, descripcion_categoria) VALUES
('Estilo Coquette & Pastel', 'Prendas con detalles romanticos, lazos, encajes y tonos suaves'),
('Urban Streetwear', 'Ropa urbana moderna, sudaderas oversize y estilo callejero'),
('Denim & Casual', 'Jeans, chaquetas de mezclilla y prendas versatiles para el dia a dia'),
('Minimalista Dark', 'Estetica oscura, tonos negros, grises y siluetas elegantes'),
('Accesorios Exclusivos', 'Complementos, bolsos y joyeria de temporada (Categoria sin prendas iniciales para probar LEFT JOIN)');

INSERT INTO prendas_tienda (codigo_prenda, nombre_prenda, id_categoria, precio, stock, estado_prenda) VALUES
('ROP-001', 'Cardigan Rosa Pastel Coquette', 1, 35.99, 25, 'disponible'),
('ROP-002', 'Vestido con Encaje y Lazos', 1, 45.50, 15, 'oferta'),
('ROP-003', 'Hoodie Oversize Neon Cyber', 2, 55.00, 30, 'disponible'),
('ROP-004', 'Jogger Cargo Streetwear Negro', 2, 42.00, 20, 'disponible'),
('ROP-005', 'Chaqueta de Mezclilla Vintage', 3, 65.99, 12, 'disponible'),
('ROP-006', 'Jeans Mom Fit Tiro Alto', 3, 48.00, 18, 'oferta'),
('ROP-007', 'Gabardina Minimalista Dark', 4, 89.99, 8, 'disponible'),
('ROP-008', 'Camiseta Basica Oversize Gris', 4, 22.50, 40, 'disponible');