-- Datos de practica: jugadores de un ranking de battle royale.
USE campuslands_mysql;

INSERT INTO jugadores_br_basico (nickname, plataforma, kills_totales, partidas_jugadas, tiene_pase_battle, fecha_registro, ultima_conexion, bio) VALUES
('ShadowSniper', 'PC', 1240, 380, TRUE, '2023-02-15', '2026-03-10 21:30:00', 'Jugador competitivo, francotirador de precision.'),
('NovaQueen', 'PS5', 980, 310, TRUE, '2023-05-01', '2026-03-11 19:45:00', NULL),
('ClutchKing99', 'Xbox', 1560, 420, FALSE, '2022-11-20', '2026-03-09 22:10:00', 'Especialista en jugadas de ultimo momento.'),
('PixelRaven', 'Mobile', 320, 150, FALSE, '2024-01-10', '2026-03-08 18:00:00', NULL),
('GhostRunner', 'PC', 2100, 500, TRUE, '2022-06-05', '2026-03-11 23:15:00', 'Top 1 de la temporada pasada.'),
('BlazeFox', 'PS5', 740, 260, FALSE, '2023-09-12', '2026-03-07 20:20:00', NULL),
('IronWolf', 'Xbox', 1890, 445, TRUE, '2022-08-01', '2026-03-10 17:50:00', 'Streamer y jugador profesional.'),
('MysticArrow', 'Mobile', 410, 190, FALSE, '2024-02-28', '2026-03-06 16:40:00', NULL),
('SilentViper', 'PC', 1050, 300, TRUE, '2023-03-22', '2026-03-11 20:05:00', 'Prefiere el juego sigiloso.');
