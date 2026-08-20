-- Datos de practica. Puedes cambiarlos o agregar mas filas.
USE campuslands_mysql;

INSERT INTO Sagas (nombre_saga, estatus) VALUES
('Star Wars', 'Activa'),
('Dune', 'Activa'),
('Matrix', 'Inactiva'),
('Alien', 'Activa'),
('Terminator', 'Inactiva'),
('Star Trek', 'Activa'),
('Back to the Future', 'Inactiva'),
('Planet of the Apes', 'Activa'),
('Blade Runner', 'Inactiva'),
('The Hunger Games', 'Activa');

INSERT INTO BitacoraMantenimiento (saga_id, accion) VALUES
(1, 'Registro Inicial'),
(2, 'Registro Inicial'),
(3, 'Registro Inicial'),
(4, 'Registro Inicial'),
(5, 'Registro Inicial'),
(6, 'Registro Inicial'),
(7, 'Registro Inicial'),
(8, 'Registro Inicial'),
(9, 'Registro Inicial'),
(10, 'Registro Inicial');