USE campuslands_mysql;

INSERT INTO equipos_streaming
(nombre, categoria, marca, precio, stock, estado)
VALUES
('Microfono USB Cardioide', 'Audio', 'HyperX', 650.00, 12, 'disponible'),
('Audifonos de Monitoreo', 'Audio', 'Audio-Technica', 850.00, 8, 'disponible'),
('Mezcladora de Audio', 'Audio', 'Behringer', 1100.00, 4, 'agotado'),
('Webcam Full HD', 'Video', 'Logitech', 480.00, 18, 'disponible'),
('Camara Mirrorless', 'Video', 'Sony', 2450.00, 5, 'disponible'),
('Panel LED RGB', 'Iluminacion', 'Neewer', 720.00, 15, 'disponible'),
('Aro de Luz LED', 'Iluminacion', 'Godox', 390.00, 10, 'disponible'),
('Capturadora HDMI', 'Captura', 'Elgato', 1350.00, 7, 'disponible'),
('Stream Deck', 'Control', 'Elgato', 980.00, 6, 'disponible'),
('Tripode Profesional', 'Soportes', 'Manfrotto', 1250.00, 0, 'descontinuado');