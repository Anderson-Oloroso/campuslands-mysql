-- Ejercicio 016 - CREATE TABLE para restaurante de comida urbana
-- Ejecutar despues de schema.sql

USE campuslands_mysql;

INSERT INTO basico_ejercicio_016 (nombre_platillo, categoria, precio, disponible, agregado_en) VALUES
('Burger Clasica',        'hamburguesas',      45.00, 'si', '2026-01-05 09:00:00'),
('Burger Doble Queso',    'hamburguesas',      58.50, 'si', '2026-01-05 09:05:00'),
('Tacos al Pastor (3u)',  'tacos',             38.00, 'si', '2026-01-10 12:00:00'),
('Tacos de Suadero (3u)', 'tacos',             40.00, 'no', '2026-01-10 12:05:00'),
('Limonada Natural',      'bebidas',           15.00, 'si', '2026-01-18 10:30:00'),
('Horchata',              'bebidas',           14.50, 'si', '2026-01-18 10:35:00'),
('Papas Gajo',            'acompañamientos',   22.00, 'si', '2026-02-02 13:15:00'),
('Aros de Cebolla',       'acompañamientos',   24.00, 'no', '2026-02-02 13:20:00'),
('Brownie con Helado',    'postres',           28.00, 'si', '2026-02-14 16:00:00'),
('Flan de Caramelo',      'postres',           20.00, 'si', '2026-02-14 16:05:00');
