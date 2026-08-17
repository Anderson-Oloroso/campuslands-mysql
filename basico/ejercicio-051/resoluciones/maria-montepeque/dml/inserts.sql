-- Datos de practica: ilustraciones de un estudio de dibujo digital.
USE campuslands_mysql;

INSERT INTO ilustraciones_basico (titulo, artista, tipo_arte, software_principal, precio, estado, fecha_entrega) VALUES
('Retrato Guardian Lunar', 'Camila Rendon', 'ilustracion', 'Procreate', 190.00, 'entregado', '2026-01-12'),
('Personaje Steampunk', 'Nicolas Duarte', 'concept_art', 'Photoshop', 270.00, 'entregado', '2026-01-20'),
('Ambiente Ciudad Flotante', 'Camila Rendon', 'concept_art', 'Photoshop', 310.00, 'en_progreso', '2026-03-08'),
('Sprite Explorador 16-bit', 'Isabela Franco', 'pixel_art', 'Aseprite', 95.00, 'entregado', '2026-01-28'),
('Ciclo de Vuelo Dragon', 'Tomas Vergara', 'animacion', 'Krita', 340.00, 'revision', '2026-02-22'),
('Portada Comic Guardianes', 'Nicolas Duarte', 'comic', 'Photoshop', 410.00, 'en_progreso', '2026-03-18'),
('Mascota Pixelada Zorro', 'Isabela Franco', 'pixel_art', 'Aseprite', 80.00, 'entregado', '2026-02-03'),
('Retrato Reina del Hielo', 'Tomas Vergara', 'ilustracion', 'Procreate', 230.00, 'revision', '2026-02-27');
