-- DML: Registro de animadores y renders de proyectos 3D
USE campuslands_mysql;

-- Inserción de 4 animadores 3D
INSERT INTO animadores_3d (codigo_animador, nombre, especialidad, nivel) VALUES
('ANI-3D-001', 'Elena Rostran', 'Lighting', 'Senior'),
('ANI-3D-002', 'Mateo Estrada', 'Keyframe', 'Mid'),
('ANI-3D-003', 'Valeria Gómez', 'Modeling', 'Senior'),
('ANI-3D-004', 'Carlos Ruiz', 'Rigging', 'Junior');

-- Inserción de 9 proyectos de renderizado 3D
INSERT INTO renders_3d (codigo_render, animador_id, proyecto_nombre, motor_render, fotogramas_totales, tiempo_render_hs, costo_farm_usd, estado, fecha_render) VALUES
('RND-001', 1, 'Cortometraje Sci-Fi', 'Redshift', 2400, 48.50, 320.00, 'completado', '2026-07-01'),
('RND-002', 2, 'Cortometraje Sci-Fi', 'Arnold', 1200, 30.00, 180.00, 'completado', '2026-07-03'),
('RND-003', 3, 'Comercial Calzado', 'Cycles', 600, 12.00, 75.00, 'completado', '2026-07-05'),
('RND-004', 1, 'Serie Animada Ch1', 'Redshift', 4800, 96.00, 650.00, 'completado', '2026-07-08'),
('RND-005', 4, 'Comercial Calzado', 'Octane', 300, 8.50, 45.00, 'fallido', '2026-07-10'),
('RND-006', 2, 'Serie Animada Ch1', 'Arnold', 3600, 72.00, 480.00, 'completado', '2026-07-12'),
('RND-007', 3, 'Videojuego Intro', 'Unreal Engine', 1800, 15.00, 110.00, 'completado', '2026-07-15'),
('RND-008', 4, 'Videojuego Intro', 'Cycles', 900, 22.00, 130.00, 'en_proceso', '2026-07-18'),
('RND-009', 1, 'Videojuego Intro', 'Redshift', 2100, 38.00, 260.00, 'completado', '2026-07-20');
