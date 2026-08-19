USE campuslands_mysql;

INSERT INTO categorias (nombre)
VALUES
('Audio'),
('Video'),
('Iluminacion'),
('Captura'),
('Soportes');

INSERT INTO equipos_streaming
(nombre, marca, precio, stock, estado, id_categoria)
VALUES
('Microfono USB Cardioide', 'HyperX', 650.00, 12, 'disponible', 1),
('Audifonos de Monitoreo', 'Audio-Technica', 850.00, 8, 'disponible', 1),
('Webcam Full HD', 'Logitech', 480.00, 18, 'disponible', 2),
('Camara Mirrorless', 'Sony', 2450.00, 5, 'disponible', 2),
('Panel LED RGB', 'Neewer', 720.00, 15, 'disponible', 3),
('Aro de Luz LED', 'Godox', 390.00, 10, 'disponible', 3),
('Capturadora HDMI', 'Elgato', 1350.00, 7, 'disponible', 4),
('Capturadora USB', 'AverMedia', 980.00, 0, 'agotado', 4),
('Brazo para Microfono', 'Elgato', 520.00, 10, 'disponible', 5),
('Tripode Profesional', 'Manfrotto', 1250.00, 0, 'agotado', 5);