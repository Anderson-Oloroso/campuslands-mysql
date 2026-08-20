USE ejercicio_13_int;

INSERT INTO peliculas (
    titulo,
    anio_estreno,
    duracion_minutos,
    clasificacion
) VALUES
('The Conjuring', 2013, 112, 'R'),
('Insidious', 2010, 103, 'PG-13'),
('It', 2017, 135, 'R'),
('The Exorcist', 1973, 122, 'R'),
('A Nightmare on Elm Street', 1984, 91, 'R'),
('Scream', 1996, 111, 'R');

INSERT INTO actores (
    nombre,
    nacionalidad
) VALUES
('Vera Farmiga', 'Estados Unidos'),
('Patrick Wilson', 'Estados Unidos'),
('Rose Byrne', 'Australia'),
('James McAvoy', 'Reino Unido'),
('Linda Blair', 'Estados Unidos'),
('Heather Langenkamp', 'Estados Unidos'),
('Neve Campbell', 'Canadá'),
('Courteney Cox', 'Estados Unidos');

INSERT INTO directores (
    nombre,
    nacionalidad
) VALUES
('James Wan', 'Malasia'),
('Andy Muschietti', 'Argentina'),
('William Friedkin', 'Estados Unidos'),
('Wes Craven', 'Estados Unidos'),
('Christopher Landon', 'Estados Unidos'),
('David F. Sandberg', 'Suecia');

INSERT INTO generos (nombre) VALUES
('Terror sobrenatural'),
('Terror psicológico'),
('Slasher'),
('Posesiones demoníacas'),
('Suspenso'),
('Paranormal');

INSERT INTO pelicula_directores (
    id_pelicula,
    id_director
) VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 3),
(5, 4),
(6, 4);

INSERT INTO pelicula_generos (
    id_pelicula,
    id_genero
) VALUES
(1, 1),
(1, 6),
(2, 1),
(2, 6),
(3, 2),
(3, 5),
(4, 4),
(5, 3),
(6, 3),
(6, 5);

INSERT INTO pelicula_actores (
    id_pelicula,
    id_actor,
    personaje
) VALUES
(1, 1, 'Lorraine Warren'),
(1, 2, 'Ed Warren'),
(2, 3, 'Renai Lambert'),
(2, 2, 'Josh Lambert'),
(3, 4, 'Bill Denbrough'),
(4, 5, 'Regan MacNeil'),
(5, 6, 'Nancy Thompson'),
(6, 7, 'Sidney Prescott'),
(6, 8, 'Gale Weathers'),
(3, 2, 'Bill adulto');