USE campuslands_mysql;

-- Inserción de Creadores (5 registros)
INSERT INTO creadores (alias, plataforma, categoria_principal, estado) VALUES
('StreamKing_GT', 'Twitch', 'Gaming', 'Activo'),
('TechReviewer_Pro', 'YouTube', 'Tech Talk', 'Activo'),
('IRL_Explorer', 'Kick', 'IRL', 'Activo'),
('CodeMaster_Live', 'Twitch', 'Software Dev', 'Activo'),
('CasualGamer_99', 'YouTube', 'Gaming', 'Inactivo');

-- Inserción de Equipos Hardware (8 registros)
INSERT INTO equipos_hardware (creador_id, tipo_componente, modelo, costo) VALUES
(1, 'Camara', 'Sony Alpha a6400', 900.00),
(1, 'Micrófono', 'Shure SM7B', 400.00),
(1, 'Encoder GPU', 'NVIDIA RTX 4080', 1200.00),
(2, 'Camara', 'Canon EOS R6', 2200.00),
(2, 'Micrófono', 'Rode Procaster', 230.00),
(3, 'Capturadora', 'Elgato HD60 X', 200.00),
(4, 'Micrófono', 'Elgato Wave 3', 150.00),
(4, 'Iluminación', 'Elgato Key Light', 200.00);

-- Inserción de Transmisiones (8 registros)
INSERT INTO transmisiones (creador_id, titulo_stream, duracion_minutos, espectadores_pico, calidad_resolucion, fecha_transmision) VALUES
(1, 'Maratón RPG - Jefe Final', 240, 1500, '1080p60', '2026-08-01 18:00:00'),
(1, 'Ranked Gameplay con Subs', 180, 1850, '1080p60', '2026-08-05 20:00:00'),
(2, 'Analizando Setup de Streaming 2026', 90, 3400, '4K60', '2026-08-02 15:00:00'),
(3, 'Caminando por Antigua Guatemala', 310, 890, '1080p30', '2026-08-04 11:00:00'),
(4, 'Creando API REST con Python y MySQL', 150, 620, '1080p60', '2026-08-03 19:30:00'),
(4, 'Optimizando Base de Datos en Vivo', 210, 950, '1080p60', '2026-08-07 19:00:00'),
(5, 'Probando nuevos juegos indie', 60, 45, '720p60', '2026-07-15 14:00:00'),
(2, 'Respondiendo preguntas en vivo', 120, 2100, '1080p60', '2026-08-10 16:00:00');

-- Inserción de Métricas Técnicas (8 registros)
INSERT INTO metricas_transmision (transmision_id, bitrate_promedio_kbps, fps_promedio, marcos_perdidos_pct) VALUES
(1, 6000, 60.0, 0.12),
(2, 6000, 59.8, 0.05),
(3, 15000, 60.0, 0.01),
(4, 4500, 29.9, 2.45),
(5, 6000, 60.0, 0.00),
(6, 6000, 60.0, 0.02),
(7, 3000, 55.2, 5.10),
(8, 8000, 60.0, 0.08);