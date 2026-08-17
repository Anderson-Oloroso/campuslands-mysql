-- DML: Registro inicial de estudiantes e inscripciones de Kickboxing
USE campuslands_mysql;

INSERT INTO inscripciones_kickboxing (nombre_estudiante, categoria, monto_pago, asistencias, estado_inscripcion, fecha_inscripcion) VALUES
('Carlos Mendoza', 'Principiante', 250.00, 12, 'activa', '2026-01-10'),
('Ana Lucia Torres', 'Intermedio', 300.00, 18, 'activa', '2026-01-15'),
('David Morales', 'Principiante', 0.00, 0, 'cancelada', '2026-02-01'),
('Sofía Ramírez', 'Avanzado', 350.00, 24, 'activa', '2026-02-10'),
('Mateo Gómez', 'Principiante', 0.00, 0, 'pendiente', '2026-03-01'),
('Fernanda López', 'Intermedio', 300.00, 2, 'inactiva', '2026-03-05'),
('Gabriel Castillo', 'Avanzado', 350.00, 30, 'activa', '2026-03-12'),
('Luis Miguel Aguilar', 'Principiante', 0.00, 0, 'cancelada', '2026-03-20');

-- Demostración de DELETE controlado (eliminación segura con WHERE de inscripciones canceladas sin asistencias)
DELETE FROM inscripciones_kickboxing 
WHERE estado_inscripcion = 'cancelada' AND asistencias = 0;
