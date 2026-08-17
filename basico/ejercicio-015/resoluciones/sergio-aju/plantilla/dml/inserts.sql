-- Datos de practica. Puedes cambiarlos o agregar mas filas.
USE campuslands_mysql;

INSERT INTO plataformas (nombre, fabricante, anio_lanzamiento) VALUES
('PC', 'Microsoft / Varios', 1981),
('PlayStation 5', 'Sony', 2020),
('Nintendo Switch', 'Nintendo', 2017),
('Xbox Series X', 'Microsoft', 2020);

INSERT INTO juegos (titulo, plataforma_id, genero, precio, estado) VALUES
('Cyberpunk 2077', 1, 'RPG', 59.99, 'Completado'),
('God of War Ragnarok', 2, 'Accion', 69.99, 'Completado'),
('The Legend of Zelda: Tears of the Kingdom', 3, 'Aventura', 69.99, 'Jugando'),
('Halo Infinite', 4, 'Shooter', 39.99, 'Pendiente'),
('Baldur Gate 3', 1, 'RPG', 59.99, 'Jugando'),
('Spider-Man 2', 2, 'Accion', 69.99, 'Pendiente'),
('Mario Kart 8 Deluxe', 3, 'Carreras', 49.99, 'Completado'),
('Forza Horizon 5', 4, 'Carreras', 49.99, 'Completado');