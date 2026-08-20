-- Ejercicio 017 - tipos de datos para tienda de ropa
-- Ejecutar despues de schema.sql

USE campuslands_mysql;

INSERT INTO basico_ejercicio_017 (nombre_producto, talla, color, precio, stock, disponible_online, fecha_ingreso, descripcion) VALUES
('Camisa Lino Casual',   'M',  'Blanco',  189.90, 25, 1, '2026-01-08', 'Camisa de lino, corte regular, ideal para clima calido.'),
('Camisa Lino Casual',   'L',  'Blanco',  189.90, 18, 1, '2026-01-08', 'Camisa de lino, corte regular, ideal para clima calido.'),
('Pantalon Chino',       'S',  'Beige',   249.00, 12, 1, '2026-01-15', 'Pantalon chino ajustado, tela resistente.'),
('Pantalon Chino',       'XL', 'Negro',   249.00, 4,  0, '2026-01-15', 'Pantalon chino ajustado, tela resistente.'),
('Chaqueta Denim',       'M',  'Azul',    459.50, 9,  1, '2026-02-02', 'Chaqueta de mezclilla clasica con botones metalicos.'),
('Vestido Floral',       'S',  'Rosado',  329.00, 15, 1, '2026-02-10', 'Vestido ligero de manga corta, estampado floral.'),
('Vestido Floral',       'XS', 'Rosado',  329.00, 0,  0, '2026-02-10', 'Vestido ligero de manga corta, estampado floral.'),
('Sudadera Oversize',    'L',  'Gris',    279.90, 30, 1, '2026-03-01', 'Sudadera de algodon con capucha, corte holgado.'),
('Falda Plisada',        'M',  'Negro',   199.00, 7,  1, '2026-03-12', 'Falda plisada a la rodilla, cintura elastica.'),
('Suéter Cuello Alto',   'S',  'Vino',    219.90, 11, 0, '2026-03-25', 'Sueter de punto grueso, cuello alto.');
