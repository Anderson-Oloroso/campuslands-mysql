-- Datos de practica: encargos de un estudio de dibujo digital.
-- Volumen mayor a lo usual para que EXPLAIN tenga un dataset realista
-- sobre el que razonar (con muy pocas filas MySQL suele preferir un
-- escaneo completo aunque exista un indice).
USE campuslands_mysql;

INSERT INTO encargos_avanzado (artista, cliente, tipo_arte, precio, fecha_encargo, estado) VALUES
('Lucia Nieto', 'Estudio Nova', 'ilustracion', 180.00, '2026-01-05', 'entregado'),
('Lucia Nieto', 'Juan Diaz', 'concept_art', 260.00, '2026-01-20', 'entregado'),
('Lucia Nieto', 'Editorial Luna', 'comic', 400.00, '2026-02-02', 'en_progreso'),
('Lucia Nieto', 'Camila Vidal', 'ilustracion', 150.00, '2026-02-14', 'entregado'),
('Lucia Nieto', 'Estudio Nova', 'concept_art', 300.00, '2026-03-01', 'pendiente'),
('Lucia Nieto', 'Pedro Ariza', 'ilustracion', 190.00, '2026-03-18', 'entregado'),
('Mateo Salas', 'Estudio Nova', 'concept_art', 280.00, '2026-01-08', 'entregado'),
('Mateo Salas', 'Indie Games SAS', 'pixel_art', 120.00, '2026-01-22', 'entregado'),
('Mateo Salas', 'Editorial Luna', 'comic', 420.00, '2026-02-05', 'en_progreso'),
('Mateo Salas', 'Juan Diaz', 'concept_art', 260.00, '2026-02-19', 'cancelado'),
('Mateo Salas', 'Indie Games SAS', 'pixel_art', 140.00, '2026-03-03', 'entregado'),
('Mateo Salas', 'Camila Vidal', 'comic', 400.00, '2026-03-21', 'pendiente'),
('Andres Pinto', 'Indie Games SAS', 'pixel_art', 90.00, '2026-01-12', 'entregado'),
('Andres Pinto', 'Indie Games SAS', 'pixel_art', 95.00, '2026-01-27', 'entregado'),
('Andres Pinto', 'Estudio Nova', 'animacion', 320.00, '2026-02-09', 'en_progreso'),
('Andres Pinto', 'Pedro Ariza', 'pixel_art', 100.00, '2026-02-24', 'entregado'),
('Andres Pinto', 'Camila Vidal', 'animacion', 350.00, '2026-03-08', 'pendiente'),
('Andres Pinto', 'Indie Games SAS', 'pixel_art', 110.00, '2026-03-25', 'entregado'),
('Valentina Rojas', 'Editorial Luna', 'animacion', 340.00, '2026-01-15', 'entregado'),
('Valentina Rojas', 'Estudio Nova', 'animacion', 360.00, '2026-01-30', 'en_progreso'),
('Valentina Rojas', 'Pedro Ariza', 'ilustracion', 200.00, '2026-02-12', 'entregado'),
('Valentina Rojas', 'Juan Diaz', 'animacion', 330.00, '2026-02-27', 'cancelado'),
('Valentina Rojas', 'Camila Vidal', 'ilustracion', 210.00, '2026-03-10', 'entregado'),
('Valentina Rojas', 'Editorial Luna', 'animacion', 370.00, '2026-03-29', 'pendiente');
