-- Datos de practica: jugadores y partidas de un ranking de battle royale.
-- PixelRaven y MysticArrow se dejan sin ninguna partida a proposito,
-- para practicar LEFT JOIN.
USE campuslands_mysql;

INSERT INTO jugadores_intermedio (nickname, plataforma) VALUES
('ShadowSniper', 'PC'),
('NovaQueen', 'PS5'),
('ClutchKing99', 'Xbox'),
('PixelRaven', 'Mobile'),
('GhostRunner', 'PC'),
('MysticArrow', 'Mobile');

INSERT INTO partidas_br_intermedio (id_jugador, posicion_final, kills, damage_total, fecha) VALUES
(1, 1, 8, 1200, '2026-01-05 20:00:00'),
(1, 3, 5, 900, '2026-01-10 21:00:00'),
(2, 1, 6, 1000, '2026-01-06 19:30:00'),
(2, 12, 2, 400, '2026-01-12 22:00:00'),
(3, 2, 9, 1400, '2026-01-07 20:15:00'),
(5, 1, 10, 1600, '2026-01-08 18:45:00'),
(5, 1, 7, 1300, '2026-01-15 19:00:00'),
(3, 5, 4, 700, '2026-01-16 21:30:00'),
(1, 1, 6, 1100, '2026-02-01 20:00:00');
