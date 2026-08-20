USE campuslands_mysql;

INSERT INTO categorias (nombre, descripcion) VALUES
('Accion', 'Videojuegos enfocados en combate y desafios'),
('Aventura', 'Videojuegos centrados en exploracion y narrativa'),
('Deportes', 'Videojuegos basados en diferentes disciplinas deportivas'),
('RPG', 'Videojuegos con progresion de personajes y elementos de rol');

INSERT INTO videojuegos
(titulo, plataforma, precio, estado, id_categoria)
VALUES
('Cyberpunk 2077', 'PC', 49.99, 'disponible', 1),
('Doom Eternal', 'PC', 39.99, 'prestado', 1),
('God of War Ragnarök', 'PlayStation 5', 59.99, 'disponible', 1),
('The Legend of Zelda: Tears of the Kingdom', 'Nintendo Switch', 69.99, 'disponible', 2),
('Red Dead Redemption 2', 'Xbox Series X', 44.99, 'mantenimiento', 2),
('EA Sports FC 26', 'PlayStation 5', 69.99, 'disponible', 3),
('Forza Horizon 5', 'Xbox Series X', 54.99, 'prestado', 3),
('Elden Ring', 'PC', 59.99, 'disponible', 4),
('Baldur''s Gate 3', 'PC', 59.99, 'disponible', 4),
('Persona 5 Royal', 'PlayStation 5', 49.99, 'mantenimiento', 4);