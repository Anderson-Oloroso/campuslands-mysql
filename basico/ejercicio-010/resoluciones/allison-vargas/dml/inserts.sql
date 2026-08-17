-- DML: Registro de participaciones en eventos de Carreras Urbanas
USE campuslands_mysql;

INSERT INTO participaciones_carreras (nombre_piloto, categoria, puntos_obtenidos, premio_acumulado, estado_piloto, fecha_carrera) VALUES
('Alejandro Silva', 'Pro Modified', 25, 3500.00, 'activo', '2026-05-10'),
('Valeria Morales', 'Drift', 18, 2000.00, 'activo', '2026-05-10'),
('Diego Fernández', 'Street', 15, 1200.00, 'activo', '2026-05-12'),
('Ricardo Ramos', 'Pro Modified', 25, 4000.00, 'activo', '2026-05-18'),
('Esteban Mendoza', 'Street', 0, 0.00, 'sancionado', '2026-05-20'),
('Camila Gutiérrez', 'Supercar', 25, 5000.00, 'activo', '2026-06-01'),
('Javier Ortiz', 'Drift', 12, 800.00, 'activo', '2026-06-05'),
('Mateo Salazar', 'Supercar', 18, 2500.00, 'activo', '2026-06-12');
