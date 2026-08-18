-- Ejercicio 019 - INSERT para paracaidismo
-- Ejecutar despues de schema.sql

USE campuslands_mysql;

INSERT INTO saltos_paracaidismo (nombre_paracaidista, nivel, altitud_metros, duracion_caida_segundos, costo_salto, fecha_salto) VALUES
('Jorge Alvarado',   'principiante', 3000, 45,  850.00, '2026-01-11'),
('Melissa Ortiz',    'intermedio',   3500, 55,  620.00, '2026-01-18'),
('Carlos Fuentes',   'avanzado',     4200, 65,  480.00, '2026-01-25'),
('Ines Salazar',     'instructor',   4500, 70,  0.00,   '2026-02-01'),
('Roberto Chávez',   'principiante', 3000, 45,  850.00, '2026-02-08'),
('Paula Vindas',     'intermedio',   3600, 58,  600.00, '2026-02-15'),
('Diego Marroquin',  'avanzado',     4300, 68,  470.00, '2026-03-02'),
('Ana Beltran',      'principiante', 3000, 45,  850.00, '2026-03-09'),
('Hugo Ramirez',     'instructor',   4600, 72,  0.00,   '2026-03-16'),
('Lucia Peraza',     'intermedio',   3500, 55,  620.00, '2026-04-04');
