-- Datos de practica: ilustradores, obras y herramientas de un estudio
-- de dibujo digital. Cada herramienta usada en una obra es una fila
-- propia (1FN).
USE campuslands_mysql;

INSERT INTO ilustradores_intermedio (nombre, especialidad) VALUES
('Camila Rendon', 'ilustracion'),
('Nicolas Duarte', 'concept_art'),
('Isabela Franco', 'pixel_art'),
('Tomas Vergara', 'animacion');

INSERT INTO obras_intermedio (id_ilustrador, titulo, software_principal, fecha_entrega, estado) VALUES
(1, 'Retrato Guardian Lunar', 'Procreate', '2026-01-12', 'entregado'),
(2, 'Personaje Steampunk', 'Photoshop', '2026-01-20', 'entregado'),
(1, 'Ambiente Ciudad Flotante', 'Photoshop', '2026-03-08', 'en_progreso'),
(3, 'Sprite Explorador 16-bit', 'Aseprite', '2026-01-28', 'entregado'),
(4, 'Ciclo de Vuelo Dragon', 'Krita', '2026-02-22', 'revision'),
(2, 'Portada Comic Guardianes', 'Photoshop', '2026-03-18', 'en_progreso');

INSERT INTO materiales_obra_intermedio (id_obra, herramienta) VALUES
(1, 'Procreate'),
(1, 'iPad'),
(1, 'Photoshop'),
(2, 'Photoshop'),
(2, 'Tableta Wacom'),
(3, 'Photoshop'),
(3, 'Procreate'),
(3, 'Illustrator'),
(4, 'Aseprite'),
(4, 'Pixaki'),
(5, 'Krita'),
(5, 'Blender Grease Pencil'),
(5, 'Tableta Wacom'),
(6, 'Photoshop'),
(6, 'Illustrator');
