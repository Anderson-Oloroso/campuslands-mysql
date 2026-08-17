-- Datos de practica para tienda de ropa (10 registros variados).
USE campuslands_mysql;

INSERT INTO basico_ejercicio_017_prendas (codigo_barras, nombre, talla, color, precio, stock, en_oferta, fecha_ingreso) 
    VALUES ('123456789012', 'Camiseta Basica Algodon', 'M', 'Blanco', 15.99, 50, FALSE, '2026-07-15'),
    ('123456789013', 'Pantalon Denim Clasico', 'L', 'Azul', 45.50, 30, FALSE, '2026-07-20'),
    ('123456789014', 'Chaqueta de Cuero Sintetico', 'M', 'Negro', 89.99, 15, TRUE, '2026-06-10'),
    ('123456789015', 'Sudadera con Capucha', 'XL', 'Gris', 35.00, 40, TRUE, '2026-08-01'),
    ('123456789016', 'Vestido Floral Verano', 'S', 'Rojo', 28.75, 25, FALSE, '2026-05-22'),
    ('123456789017', 'Shorts Deportivos', 'M', 'Negro', 18.50, 60, FALSE, '2026-08-10'),
    ('123456789018', 'Blusa Elegante Seda', 'XS', 'Beige', 42.00, 10, FALSE, '2026-07-05'),
    ('123456789019', 'Abrigo de Lana Invierno', 'L', 'Gris Oscuro', 120.00, 8, TRUE, '2026-01-15'),
    ('123456789020', 'Polo Pique Basico', 'M', 'Azul Marino', 22.99, 45, FALSE, '2026-08-12'),
    ('123456789021', 'Falda Plisada', 'S', 'Negro', 29.99, 20, FALSE, '2026-06-30');