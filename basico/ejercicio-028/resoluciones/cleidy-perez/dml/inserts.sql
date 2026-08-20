-- Datos de practica. Puedes cambiarlos o agregar mas filas.
USE campuslands_mysql;

INSERT INTO Cursos (titulo, categoria, estado) VALUES
('Desarrollo Web Full Stack', 'Programacion', 'Activo'),
('Data Science con Python', 'Datos', 'Activo'),
('Ciberseguridad Basica', 'Seguridad', 'Borrador'),
('UX/UI Design', 'Diseno', 'Pausado');

INSERT INTO Estudiantes (nombre, correo, estado) VALUES
('Carlos Gómez', 'carlos@tech.com', 'Activo'),
('Ana Martínez', 'ana@tech.com', 'Activo'),
('Luis Rodríguez', 'luis@tech.com', 'Inactivo'),
('Elena Torres', 'elena@tech.com', 'Suspendido');

INSERT INTO Matriculas (estudiante_id, curso_id, estado_matricula, estado_pago) VALUES
(1, 1, 'En Curso', 'Pagado'),
(2, 1, 'Completado', 'Pagado'),
(2, 2, 'En Curso', 'Pagado'),
(3, 2, 'Cancelado', 'Reembolsado'),
(4, 1, 'Inscrito', 'Pendiente');