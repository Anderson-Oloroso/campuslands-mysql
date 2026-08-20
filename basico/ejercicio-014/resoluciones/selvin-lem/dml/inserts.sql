-- Ejercicio 014 - fechas basicas para saga de ciencia ficcion
-- Ejecutar despues de schema.sql

USE campuslands_mysql;

INSERT INTO basico_ejercicio_014 (titulo, numero_entrega, fecha_estreno, duracion_minutos, estado, agregada_en) VALUES
('Horizonte Estelar I',    1, '2015-06-12', 128, 'estrenada', '2026-01-05 09:00:00'),
('Horizonte Estelar II',   2, '2017-07-20', 134, 'estrenada', '2026-01-05 09:05:00'),
('Horizonte Estelar III',  3, '2019-08-15', 141, 'estrenada', '2026-01-05 09:10:00'),
('Colonia Nova',           1, '2016-03-04', 119, 'estrenada', '2026-01-12 10:00:00'),
('Colonia Nova: Rebelion', 2, '2018-04-18', 125, 'estrenada', '2026-01-12 10:05:00'),
('Deriva Cuantica',        1, '2021-11-09', 122, 'estrenada', '2026-02-02 11:30:00'),
('Deriva Cuantica II',     2, '2026-12-04', 130, 'proxima',   '2026-02-02 11:35:00'),
('Ultimo Confin',          1, '2014-09-26', 115, 'estrenada', '2026-02-10 08:20:00'),
('Ultimo Confin: Origen',  2, '2027-05-14', 128, 'proxima',   '2026-02-10 08:25:00'),
('Nebulosa Perdida',       1, '2020-01-17', 0,   'cancelada', '2026-03-01 14:00:00');
