-- Datos de practica: historial de reproducciones de una playlist musical.
USE campuslands_mysql;

INSERT INTO reproducciones_intermedio (usuario, genero, duracion_seg, completada, fecha_reproduccion) VALUES
('Kael', 'pop', 210, TRUE, '2026-01-05'),
('Kael', 'pop', 60, FALSE, '2026-01-15'),
('Vex', 'rock', 245, TRUE, '2026-01-10'),
('Vex', 'reggaeton', 90, FALSE, '2026-02-01'),
('Aris', 'electronica', 230, TRUE, '2026-01-20'),
('Kael', 'reggaeton', 195, TRUE, '2026-02-05'),
('Vex', 'rock', 40, FALSE, '2026-02-15'),
('Aris', 'pop', 200, TRUE, '2026-02-20'),
('Kael', 'electronica', 230, TRUE, '2026-03-01'),
('Aris', 'reggaeton', 205, TRUE, '2026-03-05');
