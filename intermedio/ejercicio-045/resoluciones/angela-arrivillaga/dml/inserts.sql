use campuslands_mysql;

-- insercion de plataformas
insert into plataformas (nombre_plataforma) values
('PC'), ('PlayStation 5'), ('Xbox Series X'), ('Nintendo Switch');

-- insercion de juegos
insert into juegos (plataforma_id, titulo, precio, puntaje_critica, fecha_lanzamiento, estado_juego) values
(1, 'Hollow Knight', 14.99, 9.2, '2017-02-24', 'disponible'),
(1, 'Cyberpunk 2077', 59.99, 8.5, '2020-12-10', 'disponible'),
(2, 'God of War Ragnarok', 69.99, 9.5, '2022-11-09', 'disponible'),
(2, 'Elden Ring', 59.99, 9.6, '2022-02-25', 'disponible'),
(3, 'Starfield', 69.99, 7.8, '2023-09-06', 'disponible'),
(4, 'The Legend of Zelda: Tears of the Kingdom', 69.99, 9.7, '2023-05-12', 'disponible'),
(1, 'Baldur\'s Gate 3', 59.99, 9.8, '2023-08-03', 'disponible'),
(4, 'Super Mario Odyssey', 59.99, 9.4, '2017-10-27', 'agotado');