USE campuslands_mysql;

INSERT INTO usuarios
(nombre, correo)
VALUES
('Jose Herrera', 'jose.herrera@example.com'),
('Carlos Lopez', 'carlos.lopez@example.com'),
('Ana Martinez', 'ana.martinez@example.com'),
('Sofia Garcia', 'sofia.garcia@example.com');

INSERT INTO videojuegos
(usuario_id, titulo, plataforma, genero, puntaje, estado)
VALUES
(1, 'The Legend of Zelda: Breath of the Wild', 'Nintendo Switch', 'Aventura', 9.8, 'terminado'),
(1, 'Minecraft', 'PC', 'Sandbox', 9.0, 'jugando'),
(1, 'Hades', 'PC', 'Roguelike', 9.2, 'terminado'),
(2, 'God of War', 'PlayStation 5', 'Accion', 9.5, 'terminado'),
(2, 'Elden Ring', 'PlayStation 5', 'RPG', 9.6, 'jugando'),
(2, 'FIFA 25', 'PlayStation 5', 'Deportes', 8.0, 'pendiente'),
(3, 'Super Mario Odyssey', 'Nintendo Switch', 'Plataformas', 9.7, 'terminado'),
(3, 'Animal Crossing: New Horizons', 'Nintendo Switch', 'Simulacion', 8.8, 'jugando'),
(4, 'Cyberpunk 2077', 'PC', 'RPG', 8.5, 'jugando'),
(4, 'Hollow Knight', 'PC', 'Metroidvania', 9.3, 'pendiente');