-- Ejercicio 014 (Intermedio) - vistas simples para saga de ciencia ficcion
-- Ejecutar despues de schema.sql

USE campuslands_mysql;

INSERT INTO entregas_saga_cf (titulo, numero_entrega, fecha_estreno, duracion_minutos, estado) VALUES
('Horizonte Estelar I',    1, '2015-06-12', 128, 'estrenada'),
('Horizonte Estelar II',   2, '2017-07-20', 134, 'estrenada'),
('Horizonte Estelar III',  3, '2019-08-15', 141, 'estrenada'),
('Colonia Nova',           1, '2016-03-04', 119, 'estrenada'),
('Colonia Nova: Rebelion', 2, '2018-04-18', 125, 'estrenada'),
('Deriva Cuantica',        1, '2021-11-09', 122, 'estrenada'),
('Deriva Cuantica II',     2, '2026-12-04', 130, 'proxima'),
('Ultimo Confin',          1, '2014-09-26', 115, 'estrenada'),
('Ultimo Confin: Origen',  2, '2027-05-14', 128, 'proxima'),
('Nebulosa Perdida',       1, '2020-01-17', 0,   'cancelada');
