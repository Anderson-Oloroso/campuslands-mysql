-- Ejercicio 013 (Intermedio) - tablas puente para catalogo de peliculas de miedo
-- Ejecutar despues de schema.sql

USE campuslands_mysql;

INSERT INTO peliculs_miedo (titulo, subgenero, anio_estreno) VALUES
('La Habitacion Vacia',   'paranormal',  2018),
('Cuchillo en la Niebla', 'slasher',     2015),
('Mente Fragmentada',     'psicologico', 2021),
('Criatura del Pantano',  'monstruos',   2019),
('Susurros a Medianoche', 'paranormal',  2022);

INSERT INTO actores_miedo (nombre_actor, pais_origen) VALUES
('Renata Solano',   'Argentina'),
('Marco Beltrán',   'Mexico'),
('Julia Ferreira',  'Brasil'),
('Diego Salcedo',   'Colombia'),
('Ines Marroquin',  'Guatemala'),
('Hector Villa',    'Chile');

INSERT INTO reparto_pelicula_actor (id_pelicula, id_actor, personaje) VALUES
(1, 1, 'Camila'),
(1, 2, 'Padre Ruiz'),
(2, 2, 'Sargento Ortiz'),
(2, 3, 'Laura'),
(3, 1, 'Dra. Fuentes'),
(3, 4, 'Paciente 7'),
(4, 5, 'Guia del pantano'),
(4, 6, 'Investigador'),
(5, 1, 'Camila'),
(5, 3, 'Vecina');
