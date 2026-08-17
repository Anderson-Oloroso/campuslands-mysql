-- Datos de practica: catalogo de una tienda de ropa.
USE campuslands_mysql;

INSERT INTO prendas_basico (nombre, talla, precio, stock, es_temporada_alta, fecha_ingreso, descripcion) VALUES
('Camisa Oxford Blanca', 'M', 45.00, 20, TRUE, '2026-01-15', 'Camisa formal de algodon, corte clasico'),
('Camisa Casual a Cuadros', 'L', 39.90, 15, FALSE, '2026-02-10', 'Camisa manga larga estampado a cuadros'),
('Pantalon Chino Beige', 'M', 55.00, 18, FALSE, '2026-01-20', 'Pantalon de corte recto, algodon elastizado'),
('Pantalon Jogger Negro', 'S', 48.50, 10, TRUE, '2026-03-05', 'Jogger deportivo con puños ajustables'),
('Vestido Floral Verano', 'S', 62.00, 12, TRUE, '2026-04-01', 'Vestido ligero estampado floral'),
('Chaqueta Denim Clasica', 'L', 75.00, 8, FALSE, '2026-02-18', 'Chaqueta de mezclilla azul clasico'),
('Chaqueta Impermeable', 'XL', 90.00, 6, TRUE, '2026-05-12', 'Chaqueta resistente al agua para lluvia'),
('Cinturon de Cuero', 'M', 25.00, 30, FALSE, '2026-01-08', 'Cinturon de cuero genuino color cafe');
