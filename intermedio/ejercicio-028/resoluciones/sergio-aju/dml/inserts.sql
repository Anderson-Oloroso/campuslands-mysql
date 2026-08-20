USE campuslands_mysql;

-- Inserción de Estudiantes (Mínimo 8 registros)
INSERT INTO estudiantes_academia_intermedio (nombre_completo, correo, estado, fecha_registro) VALUES
('Sergio Ajú', 'sergio.aju@campus.com', 'activo', '2026-02-15'),
('María Rodríguez', 'maria.rodriguez@campus.com', 'activo', '2026-02-15'),
('Carlos Pérez', 'carlos.perez@campus.com', 'graduado', '2025-06-10'),
('Ana Gómez', 'ana.gomez@campus.com', 'pausado', '2026-03-01'),
('Luis Martínez', 'luis.martinez@campus.com', 'activo', '2026-01-20'),
('Sofía Torres', 'sofia.torres@campus.com', 'graduado', '2025-06-10'),
('Jorge Castillo', 'jorge.castillo@campus.com', 'retirado', '2026-02-01'),
('Lucía Méndez', 'lucia.mendez@campus.com', 'activo', '2026-03-12');

-- Inserción de Cursos
INSERT INTO cursos_academia (nombre_curso, categoria, duracion_semanas) VALUES
('Backend con Python y MySQL', 'Desarrollo Backend', 12),
('Frontend Avanzado con JavaScript', 'Desarrollo Frontend', 10),
('Fundamentos de Cloud y DevOps', 'Infraestructura', 8),
('Data Science y Analítica con Pandas', 'Ciencia de Datos', 14);

-- Inserción en la Tabla Puente (Inscripciones de estudiantes a múltiples cursos)
INSERT INTO inscripciones_cursos (estudiante_id, curso_id, calificacion_final, estado_inscripcion, fecha_inscripcion) VALUES
(1, 1, 95.50, 'aprobado', '2026-02-16'),
(1, 2, 88.00, 'aprobado', '2026-03-01'),
(2, 1, 91.25, 'aprobado', '2026-02-16'),
(2, 3, NULL, 'cursando', '2026-04-10'),
(3, 4, 89.00, 'aprobado', '2025-06-12'),
(4, 2, 70.00, 'reprobado', '2026-03-05'),
(5, 3, 84.50, 'aprobado', '2026-01-22'),
(6, 4, 94.00, 'aprobado', '2025-06-12'),
(7, 2, 55.00, 'reprobado', '2026-02-05'),
(8, 1, 90.00, 'aprobado', '2026-03-15');