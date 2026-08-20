INSERT INTO directores_miedo (nombre_director, nacionalidad, fecha_nacimiento) VALUES
('James Wan', 'Australiano', '1977-02-26'),
('Ari Aster', 'Estadounidense', '1986-07-15'),
('Guillermo del Toro', 'Mexicano', '1964-10-09');

INSERT INTO subgeneros_miedo (nombre_subgenero, descripcion) VALUES
('Terror Sobrenatural', 'Enfocado en fantasmas, demonios y posesiones.'),
('Slasher', 'Enfocado en un asesino en serie que persigue a un grupo de personas.'),
('Terror Psicológico', 'Enfocado en la inestabilidad mental y la paranoia.'),
('Gore / Body Horror', 'Enfocado en mutaciones, sangre y transformaciones corporales.');

INSERT INTO peliculas_miedo (director_id, titulo_espanol, titulo_original, anio_estreno, duracion_minutos, clasificacion_edad, presupuesto_usd, recaudacion_usd) VALUES
(1, 'El Conjuro', 'The Conjuring', 2013, 112, 'R', 20000000.00, 319500000.00),
(1, 'Juego Macabro / Saw', 'Saw', 2004, 103, 'R', 1200000.00, 103900000.00),
(2, 'El Legado del Diablo', 'Hereditary', 2018, 127, 'R', 10000000.00, 82800000.00),
(3, 'El Espinazo del Diablo', 'El Espinazo del Diablo', 2001, 106, 'R', 4500000.00, 6500000.00);

INSERT INTO peliculas_subgeneros (pelicula_id, subgenero_id, nivel_relevancia) VALUES
(1, 1, 'Principal'),
(1, 3, 'Secundario'),
(2, 2, 'Principal'),
(2, 4, 'Principal'),
(2, 3, 'Secundario'),
(3, 1, 'Principal'),
(3, 3, 'Principal'),
(4, 1, 'Principal'),
(4, 3, 'Secundario');