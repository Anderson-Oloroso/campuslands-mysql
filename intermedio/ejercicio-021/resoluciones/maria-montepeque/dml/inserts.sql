-- Datos de practica: artistas, proyectos y herramientas de dibujo digital.
-- Cada herramienta usada en un proyecto es una fila propia (1FN).
USE campuslands_mysql;

INSERT INTO artistas_digital_intermedio (nombre, especialidad) VALUES
('Lucia Nieto', 'ilustracion'),
('Mateo Salas', 'concept_art'),
('Andres Pinto', 'pixel_art'),
('Valentina Rojas', 'animacion');

INSERT INTO proyectos_digital_intermedio (id_artista, titulo, software_principal, fecha_entrega, estado) VALUES
(1, 'Retrato Fantasia Elfica', 'Procreate', '2026-01-10', 'entregado'),
(2, 'Personaje Cyberpunk', 'Photoshop', '2026-01-18', 'entregado'),
(1, 'Escenario Bosque Encantado', 'Photoshop', '2026-03-05', 'en_progreso'),
(3, 'Sprite Heroe 16-bit', 'Aseprite', '2026-01-25', 'entregado'),
(4, 'Ciclo de Caminata', 'Clip Studio Paint', '2026-02-20', 'revision'),
(2, 'Portada Comic Heroes', 'Photoshop', '2026-03-15', 'en_progreso');

INSERT INTO herramientas_proyecto_intermedio (id_proyecto, herramienta) VALUES
(1, 'Procreate'),
(1, 'iPad'),
(1, 'Photoshop'),
(2, 'Photoshop'),
(2, 'Wacom Tablet'),
(3, 'Photoshop'),
(3, 'Procreate'),
(3, 'Illustrator'),
(4, 'Aseprite'),
(4, 'Pixaki'),
(5, 'Clip Studio Paint'),
(5, 'After Effects'),
(5, 'Wacom Tablet'),
(6, 'Photoshop'),
(6, 'Illustrator');
