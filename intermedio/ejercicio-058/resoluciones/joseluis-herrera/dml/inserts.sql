USE campuslands_mysql;

INSERT INTO estudiantes
(nombre, correo, estado)
VALUES
('Jose Ramirez', 'jose.ramirez@campuslands.edu', 'activo'),
('Laura Gomez', 'laura.gomez@campuslands.edu', 'activo'),
('Carlos Mendez', 'carlos.mendez@campuslands.edu', 'activo'),
('Sofia Torres', 'sofia.torres@campuslands.edu', 'activo'),
('Diego Castillo', 'diego.castillo@campuslands.edu', 'activo'),
('Valentina Ruiz', 'valentina.ruiz@campuslands.edu', 'activo'),
('Andres Herrera', 'andres.herrera@campuslands.edu', 'inactivo'),
('Camila Vargas', 'camila.vargas@campuslands.edu', 'activo');

INSERT INTO cursos
(nombre, categoria, nivel, duracion_horas, estado)
VALUES
('Fundamentos de Programacion', 'Programacion', 'basico', 40, 'activo'),
('Desarrollo Web Frontend', 'Desarrollo Web', 'intermedio', 50, 'activo'),
('Bases de Datos MySQL', 'Bases de Datos', 'intermedio', 45, 'activo'),
('Python para Backend', 'Programacion', 'intermedio', 55, 'activo'),
('JavaScript Avanzado', 'Desarrollo Web', 'avanzado', 60, 'activo'),
('Arquitectura de Software', 'Ingenieria', 'avanzado', 48, 'activo');

INSERT INTO estudiante_curso
(id_estudiante, id_curso, fecha_inscripcion, nota_final, estado)
VALUES
(1, 1, '2026-01-10', 88.50, 'aprobado'),
(1, 3, '2026-02-05', 92.00, 'aprobado'),
(1, 4, '2026-03-01', 85.00, 'aprobado'),
(2, 1, '2026-01-12', 94.00, 'aprobado'),
(2, 2, '2026-02-08', 89.50, 'aprobado'),
(3, 2, '2026-01-15', 76.00, 'reprobado'),
(3, 3, '2026-02-10', 81.50, 'aprobado'),
(4, 2, '2026-01-18', 95.00, 'aprobado'),
(4, 5, '2026-03-05', 91.00, 'aprobado'),
(5, 1, '2026-01-20', 82.00, 'aprobado'),
(5, 4, '2026-02-15', 87.50, 'aprobado'),
(6, 3, '2026-01-25', 90.00, 'aprobado'),
(6, 5, '2026-03-10', 88.00, 'aprobado'),
(7, 6, '2026-02-20', 65.00, 'reprobado'),
(8, 2, '2026-03-15', 93.50, 'aprobado');