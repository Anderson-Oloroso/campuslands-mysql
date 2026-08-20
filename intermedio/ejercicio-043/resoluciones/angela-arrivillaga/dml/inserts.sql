use campuslands_mysql;

insert into peliculas (titulo, anio_estreno, puntaje_terror) values
('el conjuro', 2013, 8.5),
('hush', 2016, 7.2),
('el exorcista', 1973, 9.5),
('la cosa', 1982, 8.8),
('saw', 2004, 7.8),
('it', 2017, 7.5),
('psicosis', 1960, 9.0),
('rec', 2007, 8.1);

insert into subgeneros (nombre_subgenero) values
('sobrenatural'), ('slasher'), ('psicologico'), ('gore'), ('sci-fi');

-- asignacion de subgeneros (tabla puente)
insert into peliculas_subgeneros (pelicula_id, subgenero_id) values
(1, 1), (1, 3), -- el conjuro
(2, 3),         -- hush
(3, 1), (3, 3), -- el exorcista
(4, 5), (4, 4), -- la cosa
(5, 2), (5, 4), -- saw
(6, 1),         -- it
(7, 3), (7, 2), -- psicosis
(8, 1), (8, 4); -- rec