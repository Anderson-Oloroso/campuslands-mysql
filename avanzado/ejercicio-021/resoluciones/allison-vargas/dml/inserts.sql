-- DML: Carga de artistas e ilustraciones digitales
USE campuslands_mysql;

-- Inserción de 4 artistas
INSERT INTO artistas_digitales (codigo_artista, nombre, software_principal, nivel_experiencia) VALUES
('ART-001', 'Elena Rostran', 'Clip Studio Paint', 'Senior'),
('ART-002', 'Mateo Estrada', 'Procreate', 'Mid'),
('ART-003', 'Valeria Gómez', 'Photoshop', 'Senior'),
('ART-004', 'Carlos Ruiz', 'Krita', 'Junior');

-- Inserción de 9 ilustraciones digitales
INSERT INTO ilustraciones_digitales (codigo_ilustracion, artista_id, titulo, estilo, resolucion_px, horas_trabajo, precio_usd, estado, fecha_creacion) VALUES
('ILU-2026-001', 1, 'Cyberpunk Cityscape', 'Concept Art', '3840x2160', 18.50, 450.00, 'vendida', '2026-07-01'),
('ILU-2026-002', 2, 'Portada Fantasía', 'Ilustración Editorial', '2480x3508', 12.00, 280.00, 'publicada', '2026-07-03'),
('ILU-2026-003', 1, 'Personaje Mecha', 'Anime/Manga', '3000x3000', 15.00, 320.00, 'vendida', '2026-07-05'),
('ILU-2026-004', 3, 'Retrato Hiperrealista', 'Realismo', '4096x2160', 25.00, 600.00, 'vendida', '2026-07-08'),
('ILU-2026-005', 4, 'Escenario Retro', 'Pixel Art', '1920x1080', 8.00, 150.00, 'publicada', '2026-07-10'),
('ILU-2026-006', 2, 'Boceto Editorial', 'Ilustración Editorial', '2480x3508', 6.50, 120.00, 'en_proceso', '2026-07-12'),
('ILU-2026-007', 3, 'Concept Art Vehículo', 'Concept Art', '3840x2160', 20.00, 500.00, 'publicada', '2026-07-15'),
('ILU-2026-008', 1, 'Manga Splash Art', 'Anime/Manga', '3500x2500', 14.00, 300.00, 'en_proceso', '2026-07-18'),
('ILU-2026-009', 4, 'Sprite Character', 'Pixel Art', '1080x1080', 5.00, 90.00, 'vendida', '2026-07-20');
