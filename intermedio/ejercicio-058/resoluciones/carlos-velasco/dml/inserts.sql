USE campuslands_mysql;

INSERT INTO estudiantes (
    nombre,
    correo,
    estado
) VALUES
('Carlos Velasco', 'carlos.velasco@campuslands.com', 'activo'),
('Ana Martinez', 'ana.martinez@campuslands.com', 'activo'),
('Luis Ramirez', 'luis.ramirez@campuslands.com', 'activo'),
('Sofia Herrera', 'sofia.herrera@campuslands.com', 'activo'),
('Diego Morales', 'diego.morales@campuslands.com', 'inactivo');


INSERT INTO cursos (
    nombre,
    categoria,
    estado
) VALUES
('Fundamentos de Programacion', 'Programacion', 'activo'),
('Desarrollo Web', 'Desarrollo Web', 'activo'),
('Bases de Datos MySQL', 'Bases de Datos', 'activo'),
('Introduccion a DevOps', 'DevOps', 'inactivo');


INSERT INTO inscripciones (
    id_estudiante,
    id_curso,
    fecha_inscripcion,
    estado
) VALUES
(1, 1, '2026-08-01', 'activa'),
(1, 2, '2026-08-02', 'activa'),
(1, 3, '2026-08-03', 'activa'),
(2, 1, '2026-08-01', 'activa'),
(2, 3, '2026-08-04', 'finalizada'),
(3, 1, '2026-08-05', 'activa'),
(3, 2, '2026-08-05', 'activa'),
(4, 2, '2026-08-06', 'activa'),
(4, 3, '2026-08-07', 'activa'),
(5, 4, '2026-08-01', 'cancelada');