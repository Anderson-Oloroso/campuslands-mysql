USE campuslands_mysql;

-- Inserción de Estudiantes
INSERT INTO estudiantes (nombre, apellido, email, telefono, fecha_registro, estado) VALUES
('Carlos', 'Mendoza', 'carlos.mendoza@email.com', '+502 5555-0101', '2026-01-10', 'Activo'),
('Sofía', 'Ramírez', 'sofia.ramirez@email.com', '+502 5555-0102', '2026-01-12', 'Activo'),
('Diego', 'Fernández', 'diego.fernandez@email.com', '+502 5555-0103', '2026-01-15', 'Activo'),
('Lucía', 'Gómez', 'lucia.gomez@email.com', '+502 5555-0104', '2026-02-01', 'Graduado'),
('Mateo', 'Morales', 'mateo.morales@email.com', '+502 5555-0105', '2026-02-05', 'Activo'),
('Elena', 'Vásquez', 'elena.vasquez@email.com', '+502 5555-0106', '2026-02-10', 'Activo'),
('Javier', 'Sパーツ', 'javier.s@email.com', '+502 5555-0107', '2026-02-12', 'Inactivo'),
('Valeria', 'Castillo', 'valeria.castillo@email.com', '+502 5555-0108', '2026-02-20', 'Activo');

-- Inserción de Mentores
INSERT INTO mentores (nombre, apellido, especialidad, anios_experiencia, tarifa_hora) VALUES
('Alejandro', 'López', 'Backend Development & SQL', 8, 45.00),
('Gabriela', 'Torres', 'Frontend & UI/UX', 6, 40.00),
('Fernando', 'Ríos', 'DevOps & Cloud Architecture', 10, 60.00),
('Mariana', 'Silva', 'Data Science & Python', 5, 38.00);

-- Inserción de Bootcamps
INSERT INTO bootcamps (nombre_bootcamp, nivel, duracion_semanas, precio_tuicion) VALUES
('Web Development Fullstack', 'Intermedio', 24, 2500.00),
('Backend Software Engineering with Python', 'Avanzado', 20, 2800.00),
('Data Analytics & SQL Mastery', 'Principiante', 12, 1500.00);

-- Inserción de Módulos
INSERT INTO modulos (bootcamp_id, nombre_modulo, orden_secuencia, horas_teoricas, horas_practicas) VALUES
(1, 'Fundamentos de HTML/CSS y JS', 1, 30, 50),
(1, 'Backend con Node.js y MySQL', 2, 40, 60),
(2, 'Programación Avanzada en Python', 1, 35, 55),
(2, 'Diseño de Bases de Datos Relacionales y SQL', 2, 40, 60),
(3, 'Introducción a Bases de Datos y SQL', 1, 25, 35);

-- Inserción de Proyectos Evaluables
INSERT INTO proyectos (modulo_id, titulo_proyecto, ponderacion_porcentaje) VALUES
(1, 'Sitio Web Interactivo para E-Commerce', 30.00),
(2, 'API RESTful con Autenticación JWT y MySQL', 40.00),
(3, 'Sistema de Scripts Orientados a Objetos en Python', 35.00),
(4, 'Normalización y Consultas de Analítica en MySQL', 45.00),
(5, 'Dashboard SQL y Modelado Entidad-Relación', 50.00);

-- Inserción en Tabla Puente 1: Matriculas
INSERT INTO matriculas_bootcamp (estudiante_id, bootcamp_id, fecha_matricula, porcentaje_asistencia, estado_matricula) VALUES
(1, 1, '2026-01-11', 95.50, 'Cursando'),
(1, 2, '2026-02-01', 98.00, 'Cursando'),
(2, 1, '2026-01-13', 90.00, 'Cursando'),
(3, 2, '2026-02-02', 88.50, 'Cursando'),
(4, 3, '2026-01-10', 100.00, 'Aprobado'),
(5, 2, '2026-02-06', 92.00, 'Cursando'),
(6, 1, '2026-02-11', 85.00, 'Cursando'),
(8, 3, '2026-02-21', 96.00, 'Cursando');

-- Inserción en Tabla Puente 2: Asignación de Mentores
INSERT INTO asignacion_mentores (mentor_id, modulo_id, rol_mentor, horas_asignadas) VALUES
(1, 2, 'Líder de Módulo', 40),
(1, 4, 'Líder de Módulo', 45),
(1, 5, 'Soporte Técnico', 20),
(2, 1, 'Líder de Módulo', 50),
(3, 2, 'Soporte Técnico', 20),
(4, 3, 'Líder de Módulo', 40);

-- Inserción en Tabla Puente 3: Entregas de Proyectos
INSERT INTO entregas_proyectos (estudiante_id, proyecto_id, url_repositorio, calificacion, fecha_entrega, estado_entrega) VALUES
(1, 1, 'https://github.com/carlosm/project-ecommerce', 92.50, '2026-02-15 18:30:00', 'Calificado'),
(1, 2, 'https://github.com/carlosm/api-backend-node', 98.00, '2026-03-01 22:10:00', 'Calificado'),
(2, 1, 'https://github.com/sofiar/frontend-shop', 88.00, '2026-02-16 10:15:00', 'Calificado'),
(3, 3, 'https://github.com/diegof/python-oop-system', 85.00, '2026-02-20 14:00:00', 'Calificado'),
(3, 4, 'https://github.com/diegof/mysql-analytics', 94.00, '2026-03-05 19:45:00', 'Calificado'),
(4, 5, 'https://github.com/luciag/sql-dashboard', 100.00, '2026-02-10 11:20:00', 'Calificado'),
(5, 3, 'https://github.com/mateom/python-scripting', 78.50, '2026-02-22 16:30:00', 'Calificado'),
(8, 5, 'https://github.com/valeriac/sql-mastery', NULL, '2026-03-08 09:00:00', 'En Revisión');