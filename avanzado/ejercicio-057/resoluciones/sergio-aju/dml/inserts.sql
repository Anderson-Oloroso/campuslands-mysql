USE campuslands_mysql;

-- Inserción de Exploradores (5 registros)
INSERT INTO exploradores (alias, plataforma, nivel_experiencia, estado) VALUES
('LaraCroft_GT', 'PC', 45, 'Activo'),
('DrakeSeeker', 'PlayStation', 42, 'Activo'),
('ShadowRunner', 'Xbox', 30, 'Activo'),
('VikingRider', 'PC', 25, 'Activo'),
('PixelHunter', 'Switch', 15, 'Inactivo');

-- Inserción de Niveles del Mapa (5 registros)
INSERT INTO niveles_mapa (nombre_region, region_tipo, dificultad, puntuacion_par_objetivo) VALUES
('Templo del Sol Olvidado', 'Templo', 4, 15000),
('Cueva de los Susurros', 'Cueva', 3, 10000),
('Fortaleza Maldita de Karnak', 'Fortaleza', 8, 30000),
('Bosque de la Niebla Eterna', 'Bosque', 5, 18000),
('Ruinas Ancestrales de Tikal', 'Ruinas', 9, 45000);

-- Inserción de Puntuaciones (10 registros)
INSERT INTO puntuaciones_niveles (explorador_id, nivel_id, puntos_obtenidos, tiempo_segundos, tesoros_encontrados, muertes_registradas, fecha_partida) VALUES
(1, 1, 18500, 420, 5, 0, '2026-08-01 10:00:00'),
(2, 1, 16200, 480, 4, 1, '2026-08-01 11:30:00'),
(3, 1, 14000, 550, 3, 2, '2026-08-02 09:15:00'),
(1, 3, 32000, 890, 8, 1, '2026-08-03 14:20:00'),
(2, 3, 31000, 920, 7, 2, '2026-08-03 16:00:00'),
(4, 2, 11500, 310, 4, 0, '2026-08-04 18:45:00'),
(1, 5, 48000, 1200, 12, 0, '2026-08-05 20:10:00'),
(3, 5, 41000, 1350, 9, 3, '2026-08-06 21:30:00'),
(2, 4, 19500, 600, 6, 1, '2026-08-07 15:00:00'),
(5, 2, 8500, 400, 2, 4, '2026-08-08 12:00:00');