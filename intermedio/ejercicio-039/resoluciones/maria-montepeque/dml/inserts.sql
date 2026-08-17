-- Datos de practica: entrenadores, alumnos y clases de un gimnasio de kickboxing.
USE campuslands_mysql;

INSERT INTO entrenadores_kickboxing_intermedio (nombre, especialidad) VALUES
('Pedro Ariza', 'k1'),
('Camila Ortiz', 'contacto_pleno'),
('Julian Vega', 'semicontacto'),
('Sofia Herrera', 'light_contact');

INSERT INTO alumnos_kickboxing_intermedio (nombre, telefono) VALUES
('Mateo Rivas', '3001112233'),
('Santi Belmonte', '3002223344'),
('Diego Palma', '3003334455'),
('Ruben Casal', '3004445566');

INSERT INTO clases_kickboxing_intermedio (id_entrenador, id_alumno, tipo_clase, costo, fecha_clase) VALUES
(1, 1, 'individual', 60000.00, '2026-01-05'),
(2, 2, 'grupal', 40000.00, '2026-01-12'),
(3, 3, 'sparring', 55000.00, '2026-02-01'),
(4, 1, 'individual', 65000.00, '2026-01-08'),
(4, 4, 'grupal', 40000.00, '2026-01-10'),
(1, 2, 'sparring', 55000.00, '2026-01-15'),
(2, 3, 'individual', 65000.00, '2026-02-10'),
(3, 4, 'grupal', 40000.00, '2026-01-20'),
(1, 1, 'sparring', 55000.00, '2026-02-15');

-- Sofia Herrera (id_entrenador = 4) se retira del gimnasio. Tiene dos
-- clases registradas (id_clase 4 y 5); gracias a ON DELETE SET NULL
-- esas clases NO se borran, solo quedan sin entrenador asignado.
DELETE FROM entrenadores_kickboxing_intermedio
WHERE id_entrenador = 4;
