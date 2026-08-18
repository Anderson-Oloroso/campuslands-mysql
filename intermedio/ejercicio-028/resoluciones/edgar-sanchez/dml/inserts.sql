-- Datos de practica. Puedes cambiarlos o agregar mas filas.
USE campuslands_mysql;

INSERT INTO estudiantes (nombre_estudiante, correo, telefono, fecha_registro) VALUES
('Carlos Gómez', 'carlos.gomez@email.com', '+502 5555-2001', '2026-01-10'),
('María Fernández', 'maria.fernandez@email.com', '+502 5555-2002', '2026-01-15'),
('Luis Morales', 'luis.morales@email.com', '+502 5555-2003', '2026-02-01'),
('Andrea Salazar', 'andrea.salazar@email.com', '+502 5555-2004', '2026-02-10');

INSERT INTO cursos (codigo_curso, nombre_curso, nivel, costo_usd) VALUES
('DEV-101', 'Desarrollo Web Fullstack', 'Intermedio', 350.00),
('DBA-201', 'Bases de Datos Relacionales y MySQL', 'Intermedio', 250.00),
('MOB-301', 'Desarrollo Móvil con Flutter', 'Avanzado', 400.00),
('SEC-101', 'Fundamentos de Ciberseguridad', 'Principiante', 200.00);

INSERT INTO instructores (nombre_instructor, correo, especialidad) VALUES
('Ing. Roberto Mendoza', 'roberto.mendoza@techacademy.com', 'Arquitectura de Software'),
('Licda. Elena Torres', 'elena.torres@techacademy.com', 'Base de Datos'),
('Ing. Gustavo Leyva', 'gustavo.leyva@techacademy.com', 'Desarrollo Móvil');

INSERT INTO matriculas_cursos (estudiante_id, curso_id, fecha_matricula, estado_matricula, monto_pagado_usd) VALUES
(1, 1, '2026-02-15', 'Activo', 350.00),
(1, 2, '2026-02-16', 'Activo', 250.00),
(2, 2, '2026-02-20', 'Completado', 250.00),
(2, 3, '2026-03-01', 'Activo', 400.00),
(3, 1, '2026-03-05', 'Activo', 350.00),
(3, 4, '2026-03-10', 'Retirado', 0.00),
(4, 3, '2026-03-12', 'Activo', 400.00);

INSERT INTO asignaciones_instructores (instructor_id, curso_id, fecha_asignacion, rol) VALUES
(1, 1, '2026-01-05', 'Titular'),
(2, 2, '2026-01-05', 'Titular'),
(3, 3, '2026-01-10', 'Titular'),
(1, 3, '2026-01-12', 'Auxiliar'),
(2, 4, '2026-01-15', 'Mentor');