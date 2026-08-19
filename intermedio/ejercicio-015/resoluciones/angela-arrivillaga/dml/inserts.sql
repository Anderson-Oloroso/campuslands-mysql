USE biblioteca_gamer_db;

INSERT INTO plataformas_gaming (nombre_plataforma, fabricante) VALUES
('PC Gaming Master', 'Microsoft / Steam'),
('PlayStation 5', 'Sony'),
('Nintendo Switch', 'Nintendo'),
('Xbox Series X', 'Microsoft');

INSERT INTO videojuegos (codigo_juego, titulo_juego, id_plataforma, precio, horas_jugadas, estado_juego) VALUES
('GM-001', 'Hollow Knight: Silksong', 1, 29.99, 45, 'jugando'),
('GM-002', 'Cyberpunk 2077: Phantom Liberty', 1, 39.99, 82, 'completado'),
('GM-003', 'God of War Ragnarok', 2, 59.99, 50, 'completado'),
('GM-004', 'The Legend of Zelda: Tears of the Kingdom', 3, 69.99, 110, 'completado'),
('GM-005', 'Hades II', 1, 24.99, 35, 'jugando'),
('GM-006', 'Halo Infinite', 4, 19.99, 15, 'abandonado'),
('GM-007', 'Metroid Prime Remastered', 3, 39.99, 0, 'pendiente'),
('GM-008', 'Marvels Spider-Man 2', 2, 49.99, 25, 'jugando');