-- Datos de practica: comisiones de un estudio de dibujo digital.
-- Volumen mayor a lo usual para que EXPLAIN tenga un dataset realista
-- sobre el que razonar (con muy pocas filas MySQL suele preferir un
-- escaneo completo aunque exista un indice).
USE campuslands_mysql;

INSERT INTO comisiones_avanzado (artista, cliente, tipo_arte, precio, fecha_encargo, estado) VALUES
('Camila Rendon', 'Estudio Aurora', 'ilustracion', 190.00, '2026-01-05', 'entregado'),
('Camila Rendon', 'Juan Diaz', 'concept_art', 270.00, '2026-01-20', 'entregado'),
('Camila Rendon', 'Editorial Nova', 'comic', 410.00, '2026-02-02', 'en_progreso'),
('Camila Rendon', 'Sara Vidal', 'ilustracion', 160.00, '2026-02-14', 'entregado'),
('Camila Rendon', 'Estudio Aurora', 'concept_art', 310.00, '2026-03-01', 'pendiente'),
('Camila Rendon', 'Pedro Ariza', 'ilustracion', 200.00, '2026-03-18', 'entregado'),
('Nicolas Duarte', 'Estudio Aurora', 'concept_art', 290.00, '2026-01-08', 'entregado'),
('Nicolas Duarte', 'Indie Games SAS', 'pixel_art', 130.00, '2026-01-22', 'entregado'),
('Nicolas Duarte', 'Editorial Nova', 'comic', 430.00, '2026-02-05', 'en_progreso'),
('Nicolas Duarte', 'Juan Diaz', 'concept_art', 270.00, '2026-02-19', 'cancelado'),
('Nicolas Duarte', 'Indie Games SAS', 'pixel_art', 150.00, '2026-03-03', 'entregado'),
('Nicolas Duarte', 'Sara Vidal', 'comic', 410.00, '2026-03-21', 'pendiente'),
('Isabela Franco', 'Indie Games SAS', 'pixel_art', 95.00, '2026-01-12', 'entregado'),
('Isabela Franco', 'Indie Games SAS', 'pixel_art', 100.00, '2026-01-27', 'entregado'),
('Isabela Franco', 'Estudio Aurora', 'animacion', 330.00, '2026-02-09', 'en_progreso'),
('Isabela Franco', 'Pedro Ariza', 'pixel_art', 105.00, '2026-02-24', 'entregado'),
('Isabela Franco', 'Sara Vidal', 'animacion', 360.00, '2026-03-08', 'pendiente'),
('Isabela Franco', 'Indie Games SAS', 'pixel_art', 115.00, '2026-03-25', 'entregado'),
('Tomas Vergara', 'Editorial Nova', 'animacion', 350.00, '2026-01-15', 'entregado'),
('Tomas Vergara', 'Estudio Aurora', 'animacion', 370.00, '2026-01-30', 'en_progreso'),
('Tomas Vergara', 'Pedro Ariza', 'ilustracion', 210.00, '2026-02-12', 'entregado'),
('Tomas Vergara', 'Juan Diaz', 'animacion', 340.00, '2026-02-27', 'cancelado'),
('Tomas Vergara', 'Sara Vidal', 'ilustracion', 220.00, '2026-03-10', 'entregado'),
('Tomas Vergara', 'Editorial Nova', 'animacion', 380.00, '2026-03-29', 'pendiente');
