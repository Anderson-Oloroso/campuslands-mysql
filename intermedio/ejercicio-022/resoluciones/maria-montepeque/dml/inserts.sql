-- Datos de practica: proyectos, animadores y asignaciones de animacion 3D.
-- Sofia Herrera aparece en dos proyectos con rol y horas distintas, para
-- mostrar que esos datos dependen de la llave completa (proyecto + animador).
USE campuslands_mysql;

INSERT INTO proyectos_3d_intermedio (nombre, motor_render, fecha_entrega) VALUES
('Cortometraje El Viaje', 'Blender Cycles', '2026-04-01'),
('Comercial Bebida X', 'Arnold', '2026-02-15'),
('Serie Animada Piloto', 'Redshift', '2026-05-20'),
('Documental VFX', 'Octane', '2026-06-01');

INSERT INTO animadores_intermedio (nombre, especialidad) VALUES
('Sofia Herrera', 'rigging'),
('Mateo Duarte', 'modelado'),
('Valentina Rios', 'iluminacion'),
('Camila Ortiz', 'texturizado'),
('Julian Vega', 'animacion_personajes');

INSERT INTO asignaciones_intermedio (id_proyecto, id_animador, rol_en_proyecto, horas_asignadas) VALUES
(1, 1, 'Rigger principal', 80.00),
(1, 5, 'Animador de personajes', 120.00),
(2, 2, 'Modelador de producto', 40.00),
(2, 3, 'Iluminador', 30.00),
(3, 1, 'Rigger de apoyo', 50.00),
(3, 4, 'Texturizador de personajes', 70.00),
(3, 5, 'Animador principal', 150.00),
(4, 2, 'Modelador de escenarios', 90.00),
(4, 3, 'Iluminador senior', 60.00);
