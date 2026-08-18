-- Insercion de datos para biblioteca gamer (ejercicio-015)
USE campuslands_mysql;

-- 1. Insercion en tabla principal (estudios_desarrollo)
INSERT INTO estudios_desarrollo (nombre_estudio, pais, fundacion) VALUES
('FromSoftware', 'Japon', 1986),
('CD Projekt RED', 'Polonia', 1994),
('Rockstar Games', 'Estados Unidos', 1998),
('Valve Corporation', 'Estados Unidos', 1996),
('Santa Monica Studio', 'Estados Unidos', 1999),
('Larian Studios', 'Belgica', 1996);

-- 2. Insercion en tabla secundaria (videojuegos_catalogo)
INSERT INTO videojuegos_catalogo (titulo, id_estudio, genero, metacritic_score, precio_usd, horas_promedio_juego, lanzamiento_anio) VALUES
('Elden Ring', 1, 'Soulslike', 96, 59.99, 110, 2022),
('Dark Souls III', 1, 'Soulslike', 89, 59.99, 45, 2016),
('Bloodborne', 1, 'Soulslike', 92, 19.99, 40, 2015),
('The Witcher 3 Wild Hunt', 2, 'RPG', 93, 39.99, 120, 2015),
('Cyberpunk 2077', 2, 'RPG', 86, 59.99, 70, 2020),
('Red Dead Redemption 2', 3, 'Accion', 97, 59.99, 80, 2018),
('Grand Theft Auto V', 3, 'Accion', 97, 29.99, 40, 2013),
('Half-Life Alyx', 4, 'Shooter', 93, 59.99, 15, 2020),
('Portal 2', 4, 'Aventura', 95, 9.99, 10, 2011),
('God of War Ragnarok', 5, 'Accion', 94, 69.99, 50, 2022),
('Baldurs Gate 3', 6, 'RPG', 96, 59.99, 140, 2023),
('Divinity Original Sin 2', 6, 'RPG', 93, 44.99, 90, 2017);
