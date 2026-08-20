USE campuslands_mysql;

INSERT INTO plataformas (nombre, empresa) VALUES
('steam', 'valve'),
('playstation store', 'sony'),
('xbox store', 'microsoft'),
('nintendo eshop', 'nintendo');

INSERT INTO videojuegos (titulo, plataforma_id, precio, calificacion, estado) VALUES
('hollow knight', 1, 14.99, 9.6, 'disponible'),
('god of war ragnarok', 2, 69.99, 9.4, 'disponible'),
('halo infinite', 3, 59.99, 8.0, 'disponible'),
('the legend of zelda tears of the kingdom', 4, 69.99, 9.8, 'disponible'),
('elden ring', 1, 59.99, 9.5, 'disponible'),
('cyberpunk 2077', 1, 49.99, 8.2, 'disponible'),
('gran turismo 7', 2, 59.99, 8.8, 'agotado'),
('metroid prime 4', 4, 59.99, 0.0, 'preventa');