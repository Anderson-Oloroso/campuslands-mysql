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
('El Conjuro', 'James Wan', 'Sobrenatural', 2013, 112, 7.5, 'disponible'),
('It', 'Andy Muschietti', 'Sobrenatural', 2017, 135, 7.3, 'disponible'),
('Scream', 'Wes Craven', 'Slasher', 1996, 111, 7.4, 'no_disponible'),
('Halloween', 'John Carpenter', 'Slasher', 1978, 91, 7.7, 'disponible'),
('Hereditary', 'Ari Aster', 'Psicologico', 2018, 127, 7.3, 'disponible'),
('A Quiet Place', 'John Krasinski', 'Suspenso', 2018, 90, 7.5, 'disponible'),
('Midsommar', 'Ari Aster', 'Psicologico', 2019, 148, 7.1, 'no_disponible'),
('Alien', 'Ridley Scott', 'Ciencia ficcion', 1979, 117, 8.5, 'disponible');

INSERT INTO actores (
    nombre,
    nacionalidad
) VALUES
('Vera Farmiga', 'Estados Unidos'),
('Patrick Wilson', 'Estados Unidos'),
('Bill Skarsgard', 'Suecia'),
('Finn Wolfhard', 'Canada'),
('Neve Campbell', 'Canada'),
('Courteney Cox', 'Estados Unidos'),
('Jamie Lee Curtis', 'Estados Unidos'),
('Toni Collette', 'Australia'),
('Emily Blunt', 'Reino Unido'),
('John Krasinski', 'Estados Unidos'),
('Florence Pugh', 'Reino Unido'),
('Sigourney Weaver', 'Estados Unidos');

INSERT INTO pelicula_actor (
    id_pelicula,
    id_actor,
    personaje
) VALUES
(1, 1, 'Lorraine Warren'),
(1, 2, 'Ed Warren'),
(2, 3, 'Pennywise'),
(2, 4, 'Richie Tozier'),
(3, 5, 'Sidney Prescott'),
(3, 6, 'Gale Weathers'),
(4, 7, 'Laurie Strode'),
(5, 8, 'Annie Graham'),
(6, 9, 'Evelyn Abbott'),
(6, 10, 'Lee Abbott'),
(7, 11, 'Dani Ardor'),
(8, 12, 'Ellen Ripley');