-- DML: Registro de videojuegos en la biblioteca gamer
USE campuslands_mysql;

INSERT INTO biblioteca_juegos (titulo, plataforma, genero, horas_jugadas, puntaje_critica, estado_jugado, fecha_adquisicion) VALUES
('The Legend of Zelda: Tears of the Kingdom', 'Nintendo Switch', 'Aventura', 145, 9.8, 'completado', '2023-05-12'),
('Elden Ring', 'PC', 'RPG / Soulslike', 210, 9.6, 'completado', '2022-02-25'),
('God of War Ragnarök', 'PlayStation 5', 'Acción', 65, 9.4, 'completado', '2022-11-09'),
('Halo Infinite', 'Xbox Series X', 'Shooter', 40, 8.0, 'abandonado', '2021-12-08'),
('Cyberpunk 2077', 'PC', 'RPG', 110, 8.8, 'jugando', '2023-09-26'),
('Hollow Knight', 'PC', 'Metroidvania', 75, 9.5, 'completado', '2021-04-15'),
('Super Mario Odyssey', 'Nintendo Switch', 'Plataformas', 35, 9.7, 'completado', '2020-08-10'),
('Starfield', 'Xbox Series X', 'RPG', 50, 7.5, 'pendiente', '2023-09-06'),
('Final Fantasy VII Rebirth', 'PlayStation 5', 'JRPG', 90, 9.2, 'jugando', '2024-02-29');
