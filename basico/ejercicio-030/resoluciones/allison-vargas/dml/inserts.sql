USE streaming_relaciones_db;

INSERT INTO categorias_streaming (nombre_categoria, descripcion) VALUES
('Video', 'Cámaras, capturadoras y lentes para transmisiones'),
('Audio', 'Micrófonos, audífonos y interfaces de sonido'),
('Iluminación', 'Paneles LED, aros de luz y focos de estudio'),
('Soportes y Control', 'Brazos mecánicos, escritorios y decks de control');

INSERT INTO equipos_streaming (id_categoria, nombre_equipo, precio, stock, estado) VALUES
(1, 'Cámara Web 4K Pro', 189.99, 25, 'Disponible'),
(2, 'Micrófono Condensador USB', 129.50, 40, 'Disponible'),
(3, 'Iluminación Key Light LED', 99.00, 15, 'Agotado'),
(1, 'Capturadora de Video HDMI', 150.00, 30, 'Disponible'),
(2, 'Audífonos Monitoreo Studio', 85.00, 50, 'Disponible'),
(4, 'Brazo Mecánico para Micrófono', 35.50, 60, 'Disponible'),
(3, 'Panel Acústico Antirruido (Pack)', 45.00, 20, 'Mantenimiento'),
(4, 'Stream Deck Personalizable', 149.99, 10, 'Disponible');
