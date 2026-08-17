-- Datos de practica: renders de proyectos de animacion 3D.
USE campuslands_mysql;

INSERT INTO renders_basico (proyecto, motor_render, resolucion, tiempo_render_min, calidad_puntaje, fecha_render) VALUES
('Cortometraje El Viaje', 'Blender Cycles', '4K', 120, 8.5, '2026-01-10'),
('Cortometraje El Viaje', 'Blender Cycles', '8K', 240, 9.2, '2026-02-05'),
('Comercial Bebida X', 'Arnold', '2K', 60, 7.8, '2026-01-15'),
('Serie Animada Piloto', 'Redshift', '4K', 150, 8.0, '2026-03-01'),
('Serie Animada Piloto', 'Redshift', '1080p', 45, 7.0, '2026-03-10'),
('Videojuego Cinematica', 'V-Ray', '1080p', 40, 6.5, '2026-02-01'),
('Documental VFX', 'Octane', '8K', 300, 9.5, '2026-04-05'),
('Documental VFX', 'Octane', '720p', 20, 6.0, '2026-04-08'),
('Comercial Bebida X', 'Arnold', '2K', 65, 8.1, '2026-01-25');
