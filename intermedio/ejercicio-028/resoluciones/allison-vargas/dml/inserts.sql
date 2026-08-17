USE academia_puente_db;

INSERT INTO estudiantes (nombre_completo, correo, estado) VALUES
('Carlos Ruiz', 'carlos.ruiz@email.com', 'Activo'),
('Sofía Morales', 'sofia.morales@email.com', 'Activo'),
('Mateo Vargas', 'mateo.vargas@email.com', 'Inactivo'),
('Lucía Gómez', 'lucia.gomez@email.com', 'Activo'),
('Diego Herrera', 'diego.herrera@email.com', 'Activo');

INSERT INTO cursos (nombre_curso, categoria, costo) VALUES
('Fundamentos de JavaScript', 'Desarrollo Web', 150.00),
('Bases de Datos Relacionales', 'Base de Datos', 200.50),
('Python para Datos', 'Data Science', 300.00),
('Git y GitHub Profesional', 'Herramientas', 80.00);

INSERT INTO inscripciones (id_estudiante, id_curso, fecha_inscripcion, estado_inscripcion) VALUES
(1, 1, '2026-02-01', 'Completado'),
(1, 2, '2026-03-10', 'Cursando'),
(2, 2, '2026-03-12', 'Completado'),
(2, 3, '2026-04-05', 'Cursando'),
(3, 1, '2026-01-15', 'Retirado'),
(4, 3, '2026-02-20', 'Completado'),
(4, 4, '2026-05-01', 'Cursando'),
(5, 1, '2026-03-01', 'Completado');
