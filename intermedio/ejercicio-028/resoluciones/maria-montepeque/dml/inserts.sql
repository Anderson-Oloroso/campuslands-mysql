-- Datos de practica: estudiantes, cursos e inscripciones de una academia tech.
USE campuslands_mysql;

INSERT INTO estudiantes_intermedio (nombre, email) VALUES
('Laura Gomez', 'laura.gomez@mail.com'),
('Carlos Ruiz', 'carlos.ruiz@mail.com'),
('Ana Torres', 'ana.torres@mail.com'),
('Diego Perez', 'diego.perez@mail.com'),
('Maria Lopez', 'maria.lopez@mail.com');

INSERT INTO cursos_intermedio (nombre_curso, categoria, duracion_horas) VALUES
('Desarrollo Backend con Node.js', 'backend', 60),
('React desde Cero', 'frontend', 50),
('Fundamentos de Ciencia de Datos', 'datos', 70),
('Seguridad Ofensiva', 'seguridad', 55);

INSERT INTO inscripciones_intermedio (id_estudiante, id_curso, fecha_inscripcion, calificacion_final) VALUES
(1, 1, '2026-01-10', 4.50),
(1, 2, '2026-01-15', 4.00),
(1, 3, '2026-02-01', NULL),
(2, 3, '2026-01-12', 4.80),
(2, 4, '2026-02-05', 3.90),
(3, 4, '2026-01-20', 4.20),
(4, 1, '2026-01-25', 3.50),
(4, 2, '2026-02-10', NULL),
(5, 2, '2026-01-18', 4.70),
(5, 3, '2026-02-15', 4.10);
