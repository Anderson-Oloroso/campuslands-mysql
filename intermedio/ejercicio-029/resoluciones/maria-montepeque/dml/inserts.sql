-- Datos de practica: catalogo de un marketplace de accesorios.
USE campuslands_mysql;

INSERT INTO productos_intermedio (nombre, categoria, precio, stock, destacado) VALUES
('Collar de Perlas', 'collares', 120.00, 15, TRUE),
('Pulsera de Plata', 'pulseras', 60.00, 0, FALSE),
('Aretes de Oro', 'aretes', 200.00, 8, TRUE),
('Anillo Solitario', 'anillos', 300.00, 5, FALSE),
('Bolso de Cuero', 'bolsos', 250.00, 0, TRUE),
('Collar Minimalista', 'collares', 90.00, 20, FALSE),
('Pulsera Trenzada', 'pulseras', 45.00, 12, FALSE),
('Aretes Colgantes', 'aretes', 110.00, 0, FALSE),
('Anillo Doble Banda', 'anillos', 180.00, 6, TRUE);
