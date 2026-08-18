-- Ejercicio 020 - SELECT para estudio de tatuajes
-- Ejecutar despues de schema.sql

USE campuslands_mysql;

INSERT INTO citas_tatuajes (nombre_cliente, estilo, zona_cuerpo, horas_estimadas, costo_total, estado, fecha_cita) VALUES
('Fernando Rios',    'realismo',     'brazo completo',  6.0, 3200.00, 'completada', '2026-01-14'),
('Karen Osorio',     'minimalista',  'muñeca',          1.0, 350.00,  'completada', '2026-01-20'),
('Diego Barrera',    'tradicional',  'pantorrilla',     3.5, 1500.00, 'agendada',   '2026-06-05'),
('Silvia Menendez',  'blackwork',    'espalda alta',    5.0, 2600.00, 'agendada',   '2026-06-12'),
('Oscar Villatoro',  'acuarela',     'antebrazo',       2.5, 1100.00, 'completada', '2026-02-08'),
('Mariana Solis',    'minimalista',  'tobillo',         0.5, 200.00,  'cancelada',  '2026-02-15'),
('Kevin Aguilar',    'realismo',     'pecho',            7.0, 3800.00, 'agendada',   '2026-07-01'),
('Paola Njera',      'tradicional',  'hombro',           2.0, 950.00,  'completada', '2026-03-03'),
('Rene Estrada',     'blackwork',    'antebrazo',        4.0, 1900.00, 'completada', '2026-03-19'),
('Yolanda Perez',    'acuarela',     'clavicula',        1.5, 700.00,  'cancelada',  '2026-04-02');
