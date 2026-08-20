-- Ejercicio 013 - filtros por estado para catalogo de peliculas de miedo
-- Ejecutar despues de schema.sql

USE campuslands_mysql;

INSERT INTO basico_ejercicio_013 (titulo, subgenero, anio_estreno, calificacion, estado, agregada_en) VALUES
('La Habitacion Vacia',   'paranormal',     2018, 7.2, 'disponible', '2026-01-08 09:00:00'),
('Cuchillo en la Niebla', 'slasher',        2015, 6.8, 'disponible', '2026-01-20 10:15:00'),
('Mente Fragmentada',     'psicologico',    2021, 8.1, 'disponible', '2026-02-02 12:00:00'),
('El Ultimo Sotano',      'found_footage',  2013, 5.9, 'retirada',   '2026-02-14 15:30:00'),
('Criatura del Pantano',  'monstruos',      2019, 6.3, 'disponible', '2026-03-01 08:45:00'),
('Susurros a Medianoche', 'paranormal',     2022, 7.7, 'proxima',    '2026-03-10 11:20:00'),
('Cabaña Sin Salida',     'slasher',        2020, 6.5, 'disponible', '2026-03-25 14:00:00'),
('Grabacion Perdida',     'found_footage',  2017, 5.4, 'retirada',   '2026-04-05 09:50:00'),
('El Espejo Roto',        'psicologico',    2024, 8.4, 'proxima',    '2026-04-18 16:10:00'),
('Bestia del Bosque',     'monstruos',      2016, 6.0, 'disponible', '2026-05-02 10:40:00');
