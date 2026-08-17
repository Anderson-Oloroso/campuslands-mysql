-- Datos de practica: producciones, artistas y participaciones de un
-- estudio de animacion 3D.
-- Camila Ortiz aparece en dos producciones con rol y horas distintas,
-- para mostrar que esos datos dependen de la llave completa
-- (produccion + artista).
USE campuslands_mysql;

INSERT INTO producciones_3d_intermedio (nombre, motor_render, fecha_entrega) VALUES
('Pelicula Ecos del Bosque', 'Blender Cycles', '2026-04-01'),
('Anuncio Bebida Fresca', 'Arnold', '2026-02-15'),
('Serie Aventura Espacial', 'Redshift', '2026-05-20'),
('Documental Naturaleza Viva', 'Octane', '2026-06-01');

INSERT INTO artistas_3d_intermedio (nombre, especialidad) VALUES
('Camila Ortiz', 'rigging'),
('Mateo Duarte', 'modelado'),
('Valentina Rios', 'iluminacion'),
('Sofia Herrera', 'texturizado'),
('Julian Vega', 'animacion_personajes');

INSERT INTO participaciones_intermedio (id_produccion, id_artista, rol_en_produccion, horas_asignadas) VALUES
(1, 1, 'Rigger principal', 85.00),
(1, 5, 'Animador de personajes', 125.00),
(2, 2, 'Modelador de producto', 42.00),
(2, 3, 'Iluminador', 32.00),
(3, 1, 'Rigger de apoyo', 55.00),
(3, 4, 'Texturizador de personajes', 72.00),
(3, 5, 'Animador principal', 155.00),
(4, 2, 'Modelador de escenarios', 92.00),
(4, 3, 'Iluminador senior', 62.00);
