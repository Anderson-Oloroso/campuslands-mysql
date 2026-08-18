USE campuslands_mysql;

INSERT INTO estudiantes (nombre, email, estado) VALUES
('Ana Martinez', 'ana.martinez@campuslands.com', 'activo'),
('Carlos Ramirez', 'carlos.ramirez@campuslands.com', 'activo'),
('Laura Gomez', 'laura.gomez@campuslands.com', 'activo'),
('Miguel Torres', 'miguel.torres@campuslands.com', 'activo'),
('Sofia Herrera', 'sofia.herrera@campuslands.com', 'inactivo'),
('Daniel Lopez', 'daniel.lopez@campuslands.com', 'activo');

INSERT INTO cursos (nombre, categoria, puntaje, estado) VALUES
('Fundamentos de SQL', 'Bases de datos', 92.50, 'activo'),
('Python Backend', 'Programacion', 88.00, 'activo'),
('JavaScript Web', 'Desarrollo web', 95.00, 'activo'),
('Git y GitHub', 'Herramientas', 85.50, 'activo'),
('Modelado de bases de datos', 'Bases de datos', 90.00, 'activo'),
('Introduccion a React', 'Desarrollo web', 78.50, 'inactivo');

INSERT INTO estudiante_curso (id_estudiante, id_curso, fecha_inscripcion) VALUES
(1, 1, '2026-08-01'),
(1, 3, '2026-08-03'),
(1, 5, '2026-08-05'),
(2, 1, '2026-08-02'),
(2, 2, '2026-08-04'),
(2, 4, '2026-08-06'),
(3, 3, '2026-08-01'),
(3, 5, '2026-08-07'),
(4, 2, '2026-08-02'),
(4, 4, '2026-08-08'),
(5, 1, '2026-08-03'),
(6, 1, '2026-08-05'),
(6, 2, '2026-08-06'),
(6, 3, '2026-08-09');