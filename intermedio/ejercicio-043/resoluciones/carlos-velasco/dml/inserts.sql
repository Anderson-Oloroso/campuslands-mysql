USE campuslands_mysql;

INSERT INTO peliculas
    (titulo, director, anio_estreno, duracion_minutos, calificacion, estado)
VALUES
    ('El Exorcista', 'William Friedkin', 1973, 132, 8.1, 'disponible'),
    ('El Conjuro', 'James Wan', 2013, 112, 7.5, 'disponible'),
    ('Hereditary', 'Ari Aster', 2018, 127, 7.3, 'disponible'),
    ('Siniestro', 'Scott Derrickson', 2012, 110, 6.8, 'disponible'),
    ('Alien: El Octavo Pasajero', 'Ridley Scott', 1979, 117, 8.5, 'disponible'),
    ('It', 'Andy Muschietti', 2017, 135, 7.3, 'disponible'),
    ('Un Lugar en Silencio', 'John Krasinski', 2018, 90, 7.5, 'disponible'),
    ('La Bruja', 'Robert Eggers', 2015, 92, 6.9, 'retirada');

INSERT INTO generos
    (nombre)
VALUES
    ('Terror sobrenatural'),
    ('Psicológico'),
    ('Slasher'),
    ('Ciencia ficción'),
    ('Suspenso'),
    ('Criaturas'),
    ('Posesión'),
    ('Folk horror');

INSERT INTO pelicula_genero
    (id_pelicula, id_genero)
VALUES
    -- El Exorcista
    (1, 1),
    (1, 7),

    -- El Conjuro
    (2, 1),
    (2, 7),
    (2, 5),

    -- Hereditary
    (3, 2),
    (3, 1),

    -- Siniestro
    (4, 1),
    (4, 5),

    -- Alien
    (5, 4),
    (5, 6),
    (5, 5),

    -- It
    (6, 6),
    (6, 5),

    -- Un Lugar en Silencio
    (7, 4),
    (7, 6),
    (7, 5),

    -- La Bruja
    (8, 8),
    (8, 2);