USE campuslands_mysql;

INSERT INTO streamers (
    nombre,
    plataforma,
    estado
) VALUES
('Alex Gaming', 'Twitch', 'activo'),
('Mia Streams', 'YouTube', 'activo'),
('Leo Tech', 'Twitch', 'activo'),
('Sara Play', 'Kick', 'inactivo');

INSERT INTO equipos (
    id_streamer,
    nombre,
    categoria,
    precio,
    cantidad,
    estado
) VALUES
(1, 'Microfono USB HyperX', 'Audio', 650.00, 2, 'en_uso'),
(1, 'Webcam Logitech C920', 'Camara', 850.00, 1, 'en_uso'),
(1, 'Teclado mecanico RGB', 'Perifericos', 550.00, 1, 'en_uso'),
(2, 'Microfono Blue Yeti', 'Audio', 950.00, 2, 'en_uso'),
(2, 'Camara Sony ZV-1', 'Camara', 5200.00, 1, 'en_uso'),
(3, 'Mouse Logitech G502', 'Perifericos', 600.00, 3, 'en_uso'),
(3, 'Brazo para microfono', 'Soportes', 350.00, 2, 'disponible'),
(4, 'Audifonos gaming', 'Audio', 480.00, 1, 'disponible');