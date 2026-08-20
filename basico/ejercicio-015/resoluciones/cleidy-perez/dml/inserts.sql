-- Datos de practica. Puedes cambiarlos o agregar mas filas.
<<<<<<< HEAD
USE biblioteca_gamer_db;


INSERT INTO juegos (titulo, genero, plataforma, precio) VALUES
('The Witcher 3', 'RPG', 'PC', 39.99),
('Hades', 'Roguelike', 'PC', 24.99),
('Elden Ring', 'Soulslike', 'PlayStation', 59.99),
('Hollow Knight', 'Metroidvania', 'Switch', 14.99);

INSERT INTO biblioteca_usuario (nombre_usuario, id_juego, horas_jugadas, estado, fecha_adquisicion) VALUES
('GamerPro_99', 1, 120.5, 'Completado', '2025-01-15'),
('GamerPro_99', 3, 45.0, 'Jugando', '2025-06-10'),
('PixelQueen', 2, 80.2, 'Completado', '2025-03-22'),
('PixelQueen', 4, 5.5, 'Pendiente', '2026-02-01'),
('ShadowRider', 1, 12.0, 'Abandonado', '2025-11-05');
=======
USE campuslands_mysql;

INSERT INTO Plataformas (nombre, desarrollador) VALUES
('Steam', 'Valve'),
('PlayStation 5', 'Sony'),
('Xbox Series X', 'Microsoft'),
('Nintendo Switch', 'Nintendo'),
('Epic Games', 'Epic Games'),
('GOG', 'CD Projekt'),
('EA App', 'Electronic Arts'),
('Ubisoft Connect', 'Ubisoft'),
('Battle.net', 'Blizzard'),
('Apple Arcade', 'Apple');

INSERT INTO Videojuegos (plataforma_id, titulo, genero, horas_jugadas) VALUES
(1, 'Elden Ring', 'RPG', 180),
(1, 'Cyberpunk 2077', 'RPG', 120),
(2, 'God of War Ragnarok', 'Accion', 65),
(2, 'The Last of Us Part II', 'Accion', 45),
(3, 'Halo Infinite', 'FPS', 90),
(3, 'Forza Horizon 5', 'Carreras', 110),
(4, 'Zelda: Tears of the Kingdom', 'Aventura', 210),
(4, 'Super Mario Odyssey', 'Plataformas', 50),
(5, 'Alan Wake 2', 'Terror', 30),
(6, 'The Witcher 3', 'RPG', 250);
>>>>>>> upstream/dev
