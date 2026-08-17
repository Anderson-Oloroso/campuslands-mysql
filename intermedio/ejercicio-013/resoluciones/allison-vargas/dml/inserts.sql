-- DML: Inserción de catálogo, catálogo de subgéneros y asignaciones en tabla puente
USE campuslands_mysql;

INSERT INTO peliculas_catalogo (titulo, director, anio_estreno, duracion_minutos, calificacion_imdb, estado) VALUES
('El Conjuro', 'James Wan', 2013, 112, 7.5, 'disponible'),
('Hereditary', 'Ari Aster', 2018, 127, 7.3, 'disponible'),
('Scream', 'Wes Craven', 1996, 111, 7.4, 'disponible'),
('Alien: El Octavo Pasajero', 'Ridley Scott', 1979, 117, 8.5, 'disponible'),
('Un Lugar en Silencio', 'John Krasinski', 2018, 90, 7.5, 'disponible'),
('It (Eso)', 'Andy Muschietti', 2017, 135, 7.3, 'disponible'),
('El Exorcista', 'William Friedkin', 1973, 122, 8.1, 'disponible'),
('Midsommar', 'Ari Aster', 2019, 147, 7.1, 'disponible');

INSERT INTO subgeneros_terror (nombre_subgenero) VALUES
('Sobrenatural'),
('Terror Psicológico'),
('Slasher'),
('Sci-Fi Horror'),
('Posesión'),
('Terror Folk');

-- Múltiples subgéneros por película asociados vía tabla puente
INSERT INTO pelicula_subgenero (pelicula_id, subgenero_id) VALUES
(1, 1), (1, 5), -- El Conjuro: Sobrenatural, Posesión
(2, 2), (2, 1), -- Hereditary: Terror Psicológico, Sobrenatural
(3, 3),          -- Scream: Slasher
(4, 4), (4, 2), -- Alien: Sci-Fi Horror, Terror Psicológico
(5, 4), (5, 2), -- Un Lugar en Silencio: Sci-Fi Horror, Terror Psicológico
(6, 1), (6, 3), -- It: Sobrenatural, Slasher
(7, 5), (7, 1), -- El Exorcista: Posesión, Sobrenatural
(8, 6), (8, 2); -- Midsommar: Terror Folk, Terror Psicológico
