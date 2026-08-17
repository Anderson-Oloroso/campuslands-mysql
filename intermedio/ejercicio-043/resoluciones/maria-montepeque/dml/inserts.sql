-- Datos de practica: peliculas, actores y reparto de un catalogo de peliculas de miedo.
USE campuslands_mysql;

INSERT INTO peliculas_intermedio (titulo, subgenero, duracion_min) VALUES
('El Legado Maldito', 'sobrenatural', 108),
('Masacre en el Bosque', 'slasher', 95),
('Susurros del Manicomio', 'psicologico', 112),
('Amanecer de los Muertos', 'zombis', 120);

INSERT INTO actores_intermedio (nombre, nacionalidad) VALUES
('Elena Vidal', 'espanola'),
('Marco Solis', 'mexicano'),
('Renata Duval', 'argentina'),
('Hugo Ferreira', 'brasileno'),
('Ines Marchant', 'chilena');

INSERT INTO reparto_intermedio (id_pelicula, id_actor, personaje, papel_principal) VALUES
(1, 1, 'Clara Montenegro', TRUE),
(1, 2, 'Padre Damian', FALSE),
(1, 3, 'Sofia', FALSE),
(2, 2, 'El Cazador', TRUE),
(2, 4, 'Ranger Tomas', FALSE),
(3, 1, 'Dra. Alma Reyes', TRUE),
(3, 3, 'Paciente 14', FALSE),
(4, 4, 'Comandante Ruiz', TRUE),
(4, 5, 'Superviviente Vera', FALSE),
(4, 1, 'Cientifica Nora', FALSE);
