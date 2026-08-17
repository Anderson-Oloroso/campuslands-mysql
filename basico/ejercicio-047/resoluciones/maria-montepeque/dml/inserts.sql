-- Datos de practica: productos de una tienda de ropa.
USE campuslands_mysql;

INSERT INTO productos_ropa_basico (nombre, categoria, precio, stock, en_oferta, fecha_ingreso, ultima_venta, descripcion) VALUES
('Camiseta Basica Blanca', 'camisetas', 35000.00, 120, TRUE, '2023-02-15', '2026-03-10 18:30:00', 'Algodon 100%, corte clasico.'),
('Jean Slim Azul', 'pantalones', 89000.00, 60, FALSE, '2023-05-01', '2026-03-11 17:45:00', NULL),
('Vestido Floral Verano', 'vestidos', 120000.00, 25, TRUE, '2022-11-20', '2026-03-09 20:10:00', 'Tela ligera, ideal para clima calido.'),
('Chaqueta de Cuero', 'chaquetas', 260000.00, 15, FALSE, '2024-01-10', '2026-03-08 16:00:00', NULL),
('Tenis Urbanos Negros', 'calzado', 175000.00, 40, TRUE, '2022-06-05', '2026-03-11 21:15:00', 'Suela antideslizante, ideal para uso diario.'),
('Camiseta Estampada', 'camisetas', 42000.00, 90, FALSE, '2023-09-12', '2026-03-07 18:20:00', NULL),
('Chaqueta Impermeable', 'chaquetas', 145000.00, 30, TRUE, '2022-08-01', '2026-03-10 15:50:00', 'Resistente al agua, ligera.'),
('Pantalon Cargo', 'pantalones', 95000.00, 45, FALSE, '2024-02-28', '2026-03-06 14:40:00', NULL),
('Sandalias de Verano', 'calzado', 68000.00, 55, TRUE, '2023-03-22', '2026-03-11 19:05:00', 'Comodas y livianas.');
