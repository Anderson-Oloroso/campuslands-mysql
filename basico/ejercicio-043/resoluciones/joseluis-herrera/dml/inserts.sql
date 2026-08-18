USE campuslands_mysql;

INSERT INTO peliculas (
    titulo,
    director,
    subgenero,
    anio_estreno,
    duracion_minutos,
    calificacion,
    estado
) VALUES
('La Noche del Demonio', 'James Wan', 'Sobrenatural', 2010, 103, 7.0, 'disponible'),
('El Conjuro', 'James Wan', 'Sobrenatural', 2013, 112, 7.5, 'disponible'),
('Hereditary', 'Ari Aster', 'Psicologico', 2018, 127, 7.3, 'disponible'),
('It', 'Andy Muschietti', 'Sobrenatural', 2017, 135, 7.3, 'disponible'),
('Scream', 'Wes Craven', 'Slasher', 1996, 111, 7.4, 'no_disponible'),
('Halloween', 'John Carpenter', 'Slasher', 1978, 91, 7.7, 'disponible'),
('Alien', 'Ridley Scott', 'Ciencia ficcion', 1979, 117, 8.5, 'disponible'),
('El Exorcista', 'William Friedkin', 'Sobrenatural', 1973, 122, 8.1, 'no_disponible'),
('A Quiet Place', 'John Krasinski', 'Suspenso', 2018, 90, 7.5, 'disponible'),
('Midsommar', 'Ari Aster', 'Psicologico', 2019, 148, 7.1, 'no_disponible');