USE campuslands_mysql;

INSERT INTO cursos_academia
(nombre, categoria, nivel, duracion_horas, precio, estado)
VALUES
('Fundamentos de Programacion', 'Programacion', 'basico', 40, 450.00, 'activo'),
('HTML y CSS', 'Desarrollo Web', 'basico', 35, 380.00, 'activo'),
('JavaScript Inicial', 'Desarrollo Web', 'basico', 45, 520.00, 'activo'),
('Bases de Datos MySQL', 'Bases de Datos', 'intermedio', 50, 650.00, 'activo'),
('Python para Backend', 'Programacion', 'intermedio', 55, 720.00, 'activo'),
('Git y GitHub', 'Herramientas', 'basico', 25, 300.00, 'inactivo'),
('React JS', 'Desarrollo Web', 'intermedio', 60, 850.00, 'activo'),
('Node.js', 'Backend', 'intermedio', 55, 780.00, 'activo'),
('Arquitectura de Software', 'Ingenieria', 'avanzado', 48, 950.00, 'inactivo'),
('TypeScript Avanzado', 'Desarrollo Web', 'avanzado', 50, 900.00, 'activo');