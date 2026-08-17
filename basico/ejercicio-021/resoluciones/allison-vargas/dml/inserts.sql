-- DML: Registro de 8 proyectos de dibujo digital para probar filtros con WHERE
USE campuslands_mysql;

INSERT INTO proyectos_dibujo (codigo_proyecto, artista_nombre, software, estilo, tiempo_horas, costo_licencia_usd, estado, fecha_inicio) VALUES
('PRJ-DIG-001', 'Elena Rostran', 'Clip Studio Paint', 'Anime/Manga', 14.50, 49.99, 'completado', '2026-07-01'),
('PRJ-DIG-002', 'Mateo Estrada', 'Procreate', 'Concept Art', 22.00, 12.99, 'completado', '2026-07-03'),
('PRJ-DIG-003', 'Valeria Gómez', 'Photoshop', 'Realismo', 35.00, 239.88, 'en_proceso', '2026-07-05'),
('PRJ-DIG-004', 'Carlos Ruiz', 'Krita', 'Pixel Art', 8.00, 0.00, 'completado', '2026-07-08'),
('PRJ-DIG-005', 'Elena Rostran', 'Clip Studio Paint', 'Ilustración Editorial', 18.00, 49.99, 'en_proceso', '2026-07-10'),
('PRJ-DIG-006', 'Mateo Estrada', 'Procreate', 'Anime/Manga', 11.50, 12.99, 'pausado', '2026-07-12'),
('PRJ-DIG-007', 'Valeria Gómez', 'Photoshop', 'Concept Art', 28.00, 239.88, 'completado', '2026-07-15'),
('PRJ-DIG-008', 'Carlos Ruiz', 'Blender', 'Concept Art', 40.00, 0.00, 'en_proceso', '2026-07-18');
