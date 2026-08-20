USE biblioteca_gamer_db;

INSERT INTO plataformas (nombre_plataforma, fabricante, generacion) VALUES
('PlayStation 5', 'Sony', 9),
('Nintendo Switch', 'Nintendo', 8),
('Xbox Series X', 'Microsoft', 9),
('PC Gaming', 'Various', 10);

INSERT INTO videojuegos (titulo, id_plataforma, genero, precio, estado_inventario) VALUES
('Hollow Knight', 4, 'Metroidvania', 14.99, 'disponible'),
('God of War Ragnarok', 1, 'Accion-Aventura', 69.99, 'disponible'),
('The Legend of Zelda: Tears of the Kingdom', 2, 'Aventura', 59.99, 'disponible'),
('Halo Infinite', 3, 'Shooter', 39.99, 'prestado'),
('Cyberpunk 2077', 4, 'RPG', 49.99, 'disponible'),
('Metroid Dread', 2, 'Accion', 49.99, 'mantenimiento'),
('Spider-Man 2', 1, 'Accion', 69.99, 'disponible'),
('Forza Horizon 5', 3, 'Carreras', 49.99, 'agotado');