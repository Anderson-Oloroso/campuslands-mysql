-- DML: Inserción de obras y sus etiquetas de forma atómica (1FN)
USE campuslands_mysql;

INSERT INTO obras_dibujo_1fn (codigo_obra, artista_nombre, titulo, software, precio_usd, estado, fecha_publicacion) VALUES
('OBR-1FN-001', 'Elena Rostran', 'Cyberpunk Alley', 'Clip Studio Paint', 350.00, 'vendida', '2026-07-01'),
('OBR-1FN-002', 'Mateo Estrada', 'Bosque Encantado', 'Procreate', 220.00, 'en_venta', '2026-07-03'),
('OBR-1FN-003', 'Valeria Gómez', 'Retrato de Neón', 'Photoshop', 500.00, 'vendida', '2026-07-05'),
('OBR-1FN-004', 'Carlos Ruiz', 'Guerrero Sprite', 'Krita', 120.00, 'en_venta', '2026-07-08'),
('OBR-1FN-005', 'Elena Rostran', 'Mecha Pilot', 'Clip Studio Paint', 400.00, 'en_venta', '2026-07-10'),
('OBR-1FN-006', 'Mateo Estrada', 'Atardecer 2D', 'Procreate', 180.00, 'exhibicion', '2026-07-12'),
('OBR-1FN-007', 'Valeria Gómez', 'Concept Art Nave', 'Photoshop', 600.00, 'vendida', '2026-07-15'),
('OBR-1FN-008', 'Carlos Ruiz', 'Escenario Isométrico', 'Blender', 290.00, 'en_venta', '2026-07-18');

-- Inserción de etiquetas atómicas para cada obra
INSERT INTO etiquetas_obras (obra_id, etiqueta) VALUES
(1, 'Cyberpunk'), (1, 'Sci-Fi'), (1, 'Futurista'),
(2, 'Fantasía'), (2, 'Naturaleza'),
(3, 'Retrato'), (3, 'Neón'), (3, 'Cyberpunk'),
(4, 'Pixel Art'), (4, 'Retro'),
(5, 'Mecha'), (5, 'Anime'),
(6, 'Paisaje'), (6, 'Ilustración'),
(7, 'Sci-Fi'), (7, 'Concept Art'),
(8, '3D'), (8, 'Isométrico');
