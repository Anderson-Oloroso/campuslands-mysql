-- Datos de practica: proyectos de un estudio de dibujo digital.
USE campuslands_mysql;

INSERT INTO proyectos_basico (titulo, artista, tipo_arte, software_principal, precio, estado, fecha_entrega) VALUES
('Retrato Fantasia Elfica', 'Lucia Nieto', 'ilustracion', 'Procreate', 180.00, 'entregado', '2026-01-10'),
('Personaje Cyberpunk', 'Mateo Salas', 'concept_art', 'Photoshop', 250.00, 'entregado', '2026-01-18'),
('Escenario Bosque Encantado', 'Lucia Nieto', 'concept_art', 'Photoshop', 300.00, 'en_progreso', '2026-03-05'),
('Sprite Heroe 16-bit', 'Andres Pinto', 'pixel_art', 'Aseprite', 90.00, 'entregado', '2026-01-25'),
('Ciclo de Caminata', 'Valentina Rojas', 'animacion', 'Clip Studio Paint', 320.00, 'revision', '2026-02-20'),
('Portada Comic Heroes', 'Mateo Salas', 'comic', 'Photoshop', 400.00, 'en_progreso', '2026-03-15'),
('Mascota Pixelada', 'Andres Pinto', 'pixel_art', 'Aseprite', 75.00, 'entregado', '2026-02-01'),
('Ilustracion Portada Album', 'Valentina Rojas', 'ilustracion', 'Procreate', 220.00, 'revision', '2026-02-28');
