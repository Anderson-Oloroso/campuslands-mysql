-- DML: Registro de plataformas y videojuegos relacionados
USE campuslands_mysql;

INSERT INTO plataformas (nombre, fabricante) VALUES
('PC', 'Valve / Microsoft'),
('PlayStation 5', 'Sony'),
('Xbox Series X', 'Microsoft'),
('Nintendo Switch', 'Nintendo');

INSERT INTO videojuegos (titulo, plataforma_id, genero, precio_usd, horas_jugadas) VALUES
('Elden Ring', 1, 'Action RPG', 59.99, 180),
('God of War Ragnarök', 2, 'Acción / Aventura', 69.99, 55),
('Halo Infinite', 3, 'Shooter', 59.99, 42),
('The Legend of Zelda: Tears of the Kingdom', 4, 'Aventura', 69.99, 130),
('Cyberpunk 2077', 1, 'RPG', 49.99, 95),
('Horizon Forbidden West', 2, 'Acción / Aventura', 59.99, 60),
('Super Mario Odyssey', 4, 'Plataformas', 59.99, 40),
('Forza Horizon 5', 3, 'Carreras', 59.99, 75);
