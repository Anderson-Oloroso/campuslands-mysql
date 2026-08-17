-- DML: Registro de películas en catálogo con diversidad de estados de publicación
USE campuslands_mysql;

INSERT INTO peliculas_miedo (titulo, director, subgenero, duracion_minutos, calificacion_imdb, estado, fecha_adicion) VALUES
('El Conjuro', 'James Wan', 'Sobrenatural', 112, 7.5, 'disponible', '2026-01-15'),
('Hereditary', 'Ari Aster', 'Terror Psicológico', 127, 7.3, 'disponible', '2026-02-10'),
('Scream', 'Wes Craven', 'Slasher', 111, 7.4, 'disponible', '2026-03-01'),
('Alien: El Octavo Pasajero', 'Ridley Scott', 'Terror Espacial', 117, 8.5, 'archivada', '2026-03-20'),
('Un Lugar en Silencio 3', 'John Krasinski', 'Criaturas', 95, 0.0, 'proximamente', '2026-04-05'),
('It (Eso)', 'Andy Muschietti', 'Sobrenatural', 135, 7.3, 'disponible', '2026-04-18'),
('El Exorcista (Edición Uncut)', 'William Friedkin', 'Posesión', 122, 8.1, 'restringida', '2026-05-02'),
('Midsommar', 'Ari Aster', 'Terror Folk', 147, 7.1, 'disponible', '2026-06-11');
