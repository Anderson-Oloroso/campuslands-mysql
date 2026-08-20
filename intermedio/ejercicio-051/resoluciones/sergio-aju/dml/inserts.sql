-- Carga inicial de datos para pruebas de análisis EXPLAIN
USE campuslands_mysql;

-- Inserción de Software
INSERT INTO software_herramientas (nombre, desarrollador, licencia, version_actual) VALUES
('Clip Studio Paint', 'CELSYS', 'Pago Único', 'v3.0.2'),
('Procreate', 'Savage Interactive', 'Pago Único', 'v5.3.5'),
('Adobe Photoshop', 'Adobe', 'Suscripción', 'v25.9'),
('Krita', 'Krita Foundation', 'Gratuito', 'v5.2.2');

-- Inserción de Artistas Digitales
INSERT INTO artistas_digitales (nombre_artistico, email, estilo_predominante, nivel, pais) VALUES
('KuroCanvas', 'kuro.art@domain.com', 'Anime / Manga', 'Profesional', 'Japón'),
('CyberPen', 'cyber.pen@domain.com', 'Concept Art', 'Avanzado', 'Guatemala'),
('PixelValkyrie', 'valkyrie.art@domain.com', 'Lineart / Flat', 'Intermedio', 'México'),
('ArtisticSoul', 'soul.art@domain.com', 'Realismo Digital', 'Profesional', 'España');

-- Inserción de Ilustraciones / Proyectos Digitales
INSERT INTO ilustraciones (artista_id, software_id, titulo, numero_capas, resolucion_px, tamano_archivo_mb, tiempo_trabajo_horas, estado, fecha_creacion) VALUES
(1, 1, 'Cyberpunk Street at Night', 85, '3840x2160', 420.50, 18.50, 'Finalizado', '2026-08-01 10:00:00'),
(2, 3, 'Mecha Titan Redesign', 120, '5120x2880', 890.00, 32.00, 'Finalizado', '2026-08-03 14:30:00'),
(3, 2, 'Neon Valkyrie Portrait', 35, '2048x2048', 115.20, 6.00, 'Finalizado', '2026-08-05 09:15:00'),
(4, 3, 'Portrait of the Ancient King', 150, '6000x4000', 1250.00, 45.00, 'Finalizado', '2026-08-08 16:00:00'),
(1, 1, 'Shonen Hero Action Pose', 60, '3000x4000', 310.00, 12.00, 'En Proceso', '2026-08-10 11:20:00'),
(2, 4, 'Fantasy Landscape Study', 42, '3840x2160', 210.80, 8.50, 'En Proceso', '2026-08-12 15:45:00'),
(3, 2, 'Chibi Character Sheet', 18, '2048x2048', 85.00, 4.00, 'Finalizado', '2026-08-14 18:00:00'),
(4, 3, 'Dark Forest Concept', 95, '4096x2160', 640.00, 22.00, 'Borrador', '2026-08-16 20:30:00');