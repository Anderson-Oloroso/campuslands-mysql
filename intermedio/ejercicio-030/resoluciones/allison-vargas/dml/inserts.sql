USE streaming_carga_db;

INSERT INTO proveedores (nombre_proveedor, pais_origen, calificacion) VALUES
('TechStream Global', 'Estados Unidos', 4.80),
('Innovación en Audio S.A.', 'Japón', 4.65),
('Iluminación ProTech', 'Alemania', 4.90),
('Gaming & Broadcast Co.', 'Taiwán', 4.50);

INSERT INTO equipos_streaming (id_proveedor, nombre_equipo, categoria, precio, stock, fecha_recepcion, estado) VALUES
(1, 'Cámara Web 4K Pro', 'Video', 189.99, 25, '2026-05-10', 'Disponible'),
(2, 'Micrófono Condensador USB', 'Audio', 129.50, 40, '2026-05-12', 'Disponible'),
(3, 'Iluminación Key Light LED', 'Iluminación', 99.00, 15, '2026-05-15', 'Agotado'),
(1, 'Capturadora de Video HDMI', 'Video', 150.00, 30, '2026-05-18', 'Disponible'),
(2, 'Audífonos Monitoreo Studio', 'Audio', 85.00, 50, '2026-05-20', 'Disponible'),
(4, 'Brazo Mecánico para Micrófono', 'Soporte', 35.50, 60, '2026-05-22', 'En Tránsito'),
(3, 'Panel Acústico Antirruido (Pack)', 'Acústica', 45.00, 20, '2026-05-25', 'Disponible'),
(4, 'Stream Deck Personalizable', 'Control', 149.99, 10, '2026-05-28', 'Disponible');
