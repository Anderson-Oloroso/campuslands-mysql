USE campuslands_mysql;

INSERT INTO jugadores (nombre, nivel, estado) VALUES
('Aiden', 42, 'activo'),
('Lyra', 55, 'activo'),
('Kael', 38, 'activo'),
('Nora', 67, 'activo'),
('Riven', 74, 'activo'),
('Maya', 51, 'activo'),
('Dante', 63, 'activo'),
('Zara', 46, 'activo');

INSERT INTO partidas (
    id_jugador,
    mision,
    dificultad,
    puntuacion,
    tiempo_minutos,
    fecha_partida
) VALUES
(1, 'Ruinas del Norte', 'media', 1450, 38.50, '2026-08-01'),
(1, 'Templo Perdido', 'dificil', 2100, 52.20, '2026-08-05'),

(2, 'Bosque Sombrio', 'media', 1750, 41.30, '2026-08-01'),
(2, 'Fortaleza del Caos', 'legendaria', 3200, 68.40, '2026-08-07'),

(3, 'Cueva de Cristal', 'facil', 980, 29.80, '2026-08-02'),
(3, 'Ruinas del Norte', 'dificil', 1850, 47.60, '2026-08-08'),

(4, 'Templo Perdido', 'dificil', 2500, 49.10, '2026-08-02'),
(4, 'Fortaleza del Caos', 'legendaria', 3650, 72.50, '2026-08-09'),

(5, 'Bosque Sombrio', 'media', 2300, 36.70, '2026-08-03'),
(5, 'Guardian de las Sombras', 'legendaria', 4100, 75.30, '2026-08-10'),

(6, 'Cueva de Cristal', 'facil', 1250, 27.40, '2026-08-03'),
(6, 'Templo Perdido', 'dificil', 2750, 51.80, '2026-08-11'),

(7, 'Ruinas del Norte', 'media', 1950, 34.90, '2026-08-04'),
(7, 'Fortaleza del Caos', 'legendaria', 3900, 70.60, '2026-08-12'),

(8, 'Bosque Sombrio', 'facil', 1100, 25.60, '2026-08-04'),
(8, 'Guardian de las Sombras', 'dificil', 2400, 45.70, '2026-08-13');