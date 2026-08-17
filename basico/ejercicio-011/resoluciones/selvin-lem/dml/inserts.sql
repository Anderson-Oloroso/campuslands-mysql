-- Ejercicio 011 - validaciones simples para pingpong
-- Ejecutar despues de schema.sql

USE campuslands_mysql;

INSERT INTO jugadores_pingpong (nombre, categoria, puntaje, estado, fecha_registro) VALUES
('Carlos Méndez',   'avanzado',     92.50, 'activo',    '2026-01-15 09:00:00'),
('Ana Ramírez',     'avanzado',     88.75, 'activo',    '2026-02-03 10:30:00'),
('Luis Torres',     'intermedio',   67.00, 'activo',    '2026-02-10 14:00:00'),
('María Gómez',     'intermedio',   71.25, 'lesionado', '2026-03-01 11:15:00'),
('Pedro Castillo',  'principiante', 35.00, 'activo',    '2026-03-05 08:45:00'),
('Sofía Herrera',   'avanzado',     95.00, 'activo',    '2026-03-20 16:00:00'),
('Diego Morales',   'intermedio',   58.50, 'retirado',  '2026-04-02 09:20:00'),
('Valeria Cruz',    'principiante', 40.10, 'activo',    '2026-04-18 13:10:00'),
('Andrés Pineda',   'intermedio',   64.80, 'activo',    '2026-05-01 10:00:00'),
('Camila Rivas',    'avanzado',     90.30, 'lesionado', '2026-05-12 15:40:00');