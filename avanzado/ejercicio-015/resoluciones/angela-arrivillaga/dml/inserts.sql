use biblioteca_gamer_db;

insert into plataformas_gaming (nombre_plataforma, tipo_arquitectura) values
('pc steam', 'x86_64 windows'),
('playstation 5', 'amd zen 2 custom'),
('nintendo switch', 'arm cortex'),
('xbox series x', 'amd rdna 2');

insert into videojuegos (titulo_juego, id_plataforma, desarrollador, precio_dolares, horas_jugadas, calificacion_meta, estado_jugo, fecha_adquisicion) values
('hollow knight', 1, 'team cherry', 15.00, 65, 90, 'completado', '2024-05-10'),
('cyberpunk 2077', 1, 'cd projekt red', 59.99, 120, 86, 'completado', '2023-12-15'),
('elden ring', 2, 'fromsoftware', 59.99, 185, 96, 'completado', '2022-03-01'),
('the legend of zelda: tears of the kingdom', 3, 'nintendo epd', 69.99, 110, 96, 'jugando', '2023-05-12'),
('god of war ragnarok', 2, 'santa monica studio', 69.99, 45, 94, 'completado', '2022-11-09'),
('balatro', 1, 'localThunk', 14.99, 50, 90, 'jugando', '2024-02-20'),
('halo infinite', 4, '343 industries', 39.99, 20, 63, 'abandonado', '2021-12-08'),
('hades ii', 1, 'supergiant games', 29.99, 35, 93, 'pendiente', '2024-05-06');