-- Datos de practica. Puedes cambiarlos o agregar mas filas.
USE campuslands_mysql;

INSERT INTO basico_ejercicio_011 (nombre, id_categoria, puntaje, estado) VALUES
('Alpha 011', 1, 61.50, 'activo'),
('Beta 011', 2, 46.00, 'revision'),
('Gamma 011', 3, 31.75, 'activo');

INSERT INTO categorias (id_categoria, categoria) VALUES
(1, 'principal'),
(2, 'secundario'),
(3, 'terciario');