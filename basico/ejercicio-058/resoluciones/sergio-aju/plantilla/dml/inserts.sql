USE campuslands_mysql;

TRUNCATE TABLE estudiantes;

INSERT INTO estudiantes (documento_identidad, nombre_completo, programa_academico, promedio_academico, estado_estudiante, fecha_ingreso) VALUES
('101', 'Sergio Aju', 'Backend', 9.5, 'activo', '2026-01-15'),
('102', 'Byron Ajcet', 'Backend', 8.8, 'activo', '2026-02-01'),
('103', 'Maria Lopez', 'Frontend', 9.2, 'graduado', '2025-06-10'),
('104', 'Juan Perez', 'DataScience', 7.5, 'pausado', '2026-03-20'),
('105', 'Luisa Gomez', 'Fullstack', 9.8, 'activo', '2026-01-10'),
('106', 'Pedro Ruiz', 'Backend', 5.5, 'desertor', '2026-04-05'),
('107', 'Ana Diaz', 'Frontend', 8.9, 'activo', '2026-02-15'),
('108', 'Carlos Solis', 'DataScience', 9.1, 'graduado', '2025-08-01');