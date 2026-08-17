-- Datos de practica: renders de proyectos de un estudio de animacion 3D.
USE campuslands_mysql;

INSERT INTO renders_estudio_basico (proyecto, motor_render, resolucion, tiempo_render_min, calidad_puntaje, fecha_render) VALUES
('Pelicula Ecos del Bosque', 'Blender Cycles', '4K', 130, 8.6, '2026-01-10'),
('Pelicula Ecos del Bosque', 'Blender Cycles', '8K', 250, 9.3, '2026-02-05'),
('Anuncio Bebida Fresca', 'Arnold', '2K', 55, 7.6, '2026-01-15'),
('Serie Aventura Espacial', 'Redshift', '4K', 140, 8.1, '2026-03-01'),
('Serie Aventura Espacial', 'Redshift', '1080p', 42, 7.2, '2026-03-10'),
('Videojuego Ruinas Perdidas', 'V-Ray', '1080p', 38, 6.7, '2026-02-01'),
('Documental Naturaleza Viva', 'Octane', '8K', 310, 9.4, '2026-04-05'),
('Documental Naturaleza Viva', 'Octane', '720p', 22, 6.1, '2026-04-08'),
('Anuncio Bebida Fresca', 'Arnold', '2K', 60, 8.0, '2026-01-25');
