

USE ejercicio_13;

INSERT INTO directores (nombre, nacionalidad)
VALUES
('James Wan', 'Australia'),
('Jordan Peele', 'Estados Unidos'),
('Robert Eggers', 'Estados Unidos'),
('Ari Aster', 'Estados Unidos'),
('Mike Flanagan', 'Estados Unidos'),
('Jennifer Kent', 'Australia'),
('Guillermo del Toro', 'México'),
('Robert Zemeckis', 'Estados Unidos'),
('Sam Raimi', 'Estados Unidos'),
('David F. Sandberg', 'Suecia');

INSERT INTO generos (nombre)
VALUES
('Terror'),
('Suspenso'),
('Sobrenatural'),
('Psicologico'),
('Slasher'),
('Paranormal'),
('Gore'),
('Monstruos'),
('Folk Horror'),
('Misterio');

INSERT INTO peliculas
(titulo, anio_lanzamiento, duracion_minutos, clasificacion, estado, presupuesto, id_director)
VALUES
('El Conjuro', 2013, 112, 'B15', 'Disponible', 20000000.00, 1),
('Get Out', 2017, 104, 'B15', 'Disponible', 4500000.00, 2),
('The Witch', 2015, 93, 'B15', 'No disponible', 4000000.00, 3),
('Hereditary', 2018, 127, 'C', 'Disponible', 10000000.00, 4),
('Doctor Sleep', 2019, 152, 'C', 'Proximamente', 45000000.00, 5),
('The Babadook', 2014, 94, 'B15', 'Disponible', 2000000.00, 6),
('El Laberinto del Fauno', 2006, 118, 'B15', 'Disponible', 19000000.00, 7),
('La Casa de los Horrores', 2020, 110, 'B15', 'No disponible', 12000000.00, 8),
('Evil Dead Rise', 2023, 96, 'C', 'Disponible', 15000000.00, 9),
('Annabelle: Creation', 2017, 109, 'B15', 'Proximamente', 15000000.00, 10);

INSERT INTO pelicula_genero (id_pelicula, id_genero)
VALUES
(1, 1),
(1, 3),
(2, 1),
(2, 4),
(3, 1),
(3, 9),
(4, 1),
(4, 4),
(5, 1),
(5, 3),
(6, 1),
(6, 6),
(7, 1),
(7, 8),
(8, 1),
(8, 10),
(9, 1),
(9, 7),
(10, 1),
(10, 6);