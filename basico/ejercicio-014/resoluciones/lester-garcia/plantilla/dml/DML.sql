USE ejercicio_14;

USE saga_ciencia_ficcion;

INSERT INTO sagas
(nombre, creador, fecha_inicio, fecha_fin)
VALUES
('Galactic Wars', 'James Anderson', '2010-03-15', '2020-11-20'),
('Chronicles of Mars', 'Laura Mitchell', '2012-06-10', '2022-09-18'),
('Star Frontier', 'Michael Carter', '2015-01-25', NULL),
('Quantum Legacy', 'Robert Williams', '2018-04-12', NULL),
('Cosmic Empire', 'Daniel Brooks', '2008-08-30', '2019-12-15'),
('Future Earth', 'Samantha Reed', '2016-02-20', '2025-05-10'),
('Dark Universe', 'Christopher Stone', '2014-07-05', '2021-10-22'),
('Neon Galaxy', 'Emily Johnson', '2020-01-18', NULL),
('Time Travelers', 'Andrew Wilson', '2011-11-03', '2023-06-30'),
('Beyond Stars', 'Sophia Miller', '2019-09-14', NULL);

INSERT INTO peliculas
(titulo, fecha_estreno, duracion_minutos, presupuesto, id_saga)
VALUES
('Galactic Wars: Origins', '2010-05-20', 132, 85000000.00, 1),
('Galactic Wars: Rebellion', '2014-08-15', 140, 110000000.00, 1),
('Mars Awakening', '2012-07-22', 125, 70000000.00, 2),
('Mars Colony', '2017-09-10', 138, 95000000.00, 2),
('Star Frontier', '2015-03-18', 145, 120000000.00, 3),
('Quantum Legacy', '2018-06-21', 128, 105000000.00, 4),
('Cosmic Empire', '2008-10-05', 150, 135000000.00, 5),
('Future Earth', '2016-04-12', 119, 80000000.00, 6),
('Dark Universe', '2014-09-25', 142, 115000000.00, 7),
('Neon Galaxy', '2020-03-14', 130, 90000000.00, 8);

INSERT INTO personajes
(nombre, especie, fecha_creacion, id_saga)
VALUES
('Commander Alex', 'Humano', '2010-03-20', 1),
('General Marcus', 'Humano', '2011-05-15', 1),
('Captain Elena', 'Humano', '2012-06-20', 2),
('Zarok', 'Marciano', '2012-08-10', 2),
('Nova Prime', 'Humano', '2015-02-15', 3),
('Quantum', 'Cyborg', '2018-05-01', 4),
('Emperor Xeron', 'Alienígena', '2008-09-12', 5),
('Sarah Stone', 'Humano', '2016-03-05', 6),
('Dark Lord', 'Alienígena', '2014-08-20', 7),
('Neo', 'Humano', '2020-02-10', 8);

INSERT INTO lanzamientos
(id_pelicula, plataforma, fecha_lanzamiento, hora_lanzamiento)
VALUES
(1, 'Cine', '2010-05-20', '19:30:00'),
(2, 'Cine', '2014-08-15', '20:00:00'),
(3, 'Streaming', '2012-07-22', '18:00:00'),
(4, 'Streaming', '2017-09-10', '19:00:00'),
(5, 'Cine', '2015-03-18', '21:00:00'),
(6, 'Streaming', '2018-06-21', '18:30:00'),
(7, 'Cine', '2008-10-05', '20:30:00'),
(8, 'Streaming', '2016-04-12', '17:30:00'),
(9, 'Cine', '2014-09-25', '21:30:00'),
(10, 'Streaming', '2020-03-14', '19:30:00');