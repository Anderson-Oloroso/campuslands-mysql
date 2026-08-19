use dibujo_digital_db;

insert into lienzos_digitales (codigo_lienzo, titulo_obra, software_utilizado, resolucion_ancho, resolucion_alto, capas_totales, tiempo_horas, estado_proyecto) values
('ART-001', 'Cyberpunk Jinx Neon Portrait', 'Clip Studio Paint', 3840, 2160, 45, 18.50, 'finalizado'),
('ART-002', 'Hollow Knight Abyss Exploration', 'Procreate', 3000, 3000, 32, 24.00, 'finalizado'),
('ART-003', 'Studio Ghibli Meadow Sunset', 'Krita', 4096, 2160, 60, 35.20, 'en_proceso'),
('ART-004', 'Coquette Pastel Room Concept', 'Clip Studio Paint', 2560, 1440, 28, 12.00, 'borrador'),
('ART-005', 'Dark Fantasy Knight Armor', 'Photoshop', 3840, 2560, 50, 42.80, 'en_proceso'),
('ART-006', 'Neon Synthwave Cityscape', 'Krita', 1920, 1080, 20, 8.50, 'finalizado'),
('ART-007', 'Chibi Cat Cafe Sketch', 'Procreate', 2048, 2048, 15, 5.00, 'borrador'),
('ART-008', 'Ethereal Forest Spirit', 'Clip Studio Paint', 3000, 4000, 38, 29.10, 'archivado');

insert into etiquetas_lienzo (id_lienzo, nombre_etiqueta) values
(1, 'Cyberpunk'), (1, 'Neon'), (1, 'Retrato'),
(2, 'Fanart'), (2, 'Atmospferico'), (2, 'Oscuro'),
(3, 'Paisaje'), (3, 'Naturaleza'), (3, 'Pastel'),
(4, 'Coquette'), (4, 'Interior'), (4, 'Suave'),
(5, 'Ilustracion'), (5, 'Armadura'), (5, 'Detallado'),
(6, 'SciFi'), (6, 'Cyberpunk'), (6, 'Urbano'),
(7, 'Kawaii'), (7, 'Gatos'), (7, 'Sketch'),
(8, 'Fantasia'), (8, 'Magico'), (8, 'ConceptArt');