use dibujo_digital_explain_db;

insert into artistas (nombre_artistico, correo_electronico, nivel_experiencia) values
('Angela Art', 'angela.art@campus.com', 'profesional'),
('JinxChaos', 'jinx.chaos@campus.com', 'maestro'),
('CyberPunkStyle', 'cyberpunk@campus.com', 'intermedio'),
('GhibliDreamer', 'ghibli.dream@campus.com', 'profesional'),
('PixelValkyrie', 'valkyrie.pixel@campus.com', 'novato'),
('NeonBrush', 'neon.brush@campus.com', 'intermedio');

insert into software_dibujo (nombre_software, desarrollador, tipo_licencia) values
('Clip Studio Paint', 'Celsys', 'pago_unico'),
('Procreate', 'Savage Interactive', 'pago_unico'),
('Krita', 'Krita Foundation', 'gratuito'),
('Adobe Photoshop', 'Adobe Inc', 'suscripcion'),
('Blender (GPencil)', 'Blender Foundation', 'gratuito');

insert into obras (id_artista, id_software, titulo_obra, resolucion_ancho, resolucion_alto, megabytes_peso, estado_publicacion, fecha_creacion) values
(1, 1, 'Neon City Cyberpunk 2077', 3840, 2160, 145.50, 'publicado', '2026-01-15 10:30:00'),
(1, 2, 'Coquette Pastel Dream', 2048, 2048, 45.20, 'publicado', '2026-02-10 14:20:00'),
(2, 4, 'Jinx Pow-Pow Chaos', 4096, 2304, 210.80, 'publicado', '2026-03-01 09:00:00'),
(3, 3, 'Neon Alleyway Rain', 1920, 1080, 28.40, 'publicado', '2026-03-12 16:45:00'),
(4, 1, 'Totoro Ghibli Forest Spirit', 3840, 2160, 180.00, 'publicado', '2026-04-05 11:15:00'),
(5, 3, 'Hollow Knight Abyss Sketch', 1920, 1080, 15.60, 'borrador', '2026-05-02 08:30:00'),
(6, 2, 'Valkyrie Armor Concept', 2560, 1440, 88.90, 'publicado', '2026-06-10 13:00:00'),
(2, 4, 'Zaun Undercity Underworld', 4096, 2160, 240.10, 'archivado', '2026-06-20 18:00:00'),
(3, 5, '3D Mech Concept Lineart', 3840, 2160, 310.00, 'publicado', '2026-07-01 15:30:00'),
(1, 1, 'Soft Girl Aesthetic Grid', 2048, 2048, 52.30, 'borrador', '2026-07-15 12:00:00');

insert into pinceles (nombre_pincel, tipo_trazo) values
('G-Pen Traditional', 'ink'),
('Soft Airbrush Glow', 'airbrush'),
('Rough Sketch Pencil', 'sketch'),
('Oil Paint Thick Impasto', 'paint'),
('Digital Watercolor Texture', 'texture');

insert into obras_pinceles (id_obra, id_pincel) values
(1, 1), (1, 2), (1, 3),
(2, 2), (2, 5),
(3, 1), (3, 2), (3, 4),
(4, 3), (4, 5),
(5, 4), (5, 5),
(6, 1), (6, 3),
(7, 1), (7, 2),
(8, 2), (8, 4),
(9, 3), (9, 4), (9, 5),
(10, 2), (10, 5);