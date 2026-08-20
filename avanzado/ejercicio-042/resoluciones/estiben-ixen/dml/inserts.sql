-- Insercion de datos para playlist musical (ejercicio-042)
USE campuslands_mysql;

-- Insercion en artistas_musicales
INSERT INTO artistas_musicales (nombre_artistico, pais_origen, oyentes_mensuales, estado) VALUES
('Daft Punk', 'Francia', 28000000, 'Retirado'),
('The Weeknd', 'Canada', 105000000, 'Activo'),
('Arctic Monkeys', 'Reino Unido', 42000000, 'Activo'),
('Dua Lipa', 'Reino Unido', 78000000, 'Activo'),
('Bad Bunny', 'Puerto Rico', 82000000, 'Activo'),
('Gorillaz', 'Reino Unido', 31000000, 'Activo');

-- Insercion en canciones_playlist
INSERT INTO canciones_playlist (titulo, id_artista, genero, duracion_segundos, reproducciones, bpm, fecha_lanzamiento) VALUES
('Blinding Lights', 2, 'Pop', 200, 3900000000, 171, '2019-11-29'),
('Starboy', 2, 'Pop', 230, 2800000000, 186, '2016-09-22'),
('One More Time', 1, 'Electronica', 320, 950000000, 123, '2000-11-13'),
('Get Lucky', 1, 'Electronica', 248, 1400000000, 116, '2013-04-19'),
('Do I Wanna Know?', 3, 'Rock', 272, 2200000000, 85, '2013-06-19'),
('505', 3, 'Indie', 253, 1600000000, 140, '2007-04-23'),
('Levitating', 4, 'Pop', 203, 1950000000, 103, '2020-03-27'),
('Don t Start Now', 4, 'Pop', 183, 2300000000, 124, '2019-10-31'),
('Titi Me Pregunto', 5, 'Reggaeton', 243, 1700000000, 111, '2022-05-06'),
('Monaco', 5, 'Hip Hop', 267, 890000000, 139, '2023-10-13'),
('Feel Good Inc.', 6, 'Hip Hop', 221, 1500000000, 139, '2005-05-09'),
('Clint Eastwood', 6, 'Hip Hop', 340, 980000000, 84, '2001-03-05');

