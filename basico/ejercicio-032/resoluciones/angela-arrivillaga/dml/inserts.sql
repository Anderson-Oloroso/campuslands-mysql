use ranking_battle_royale_db;

insert into rangos_liga (nombre_liga, puntos_minimos) values
('bronce', 0),
('plata', 1000),
('oro', 2500),
('diamante', 5000),
('maestro', 10000);

insert into jugadores_battle_royale (gamertag, id_rango, puntos_ranking, partidas_jugadas, victorias_obtenidas, precision_disparo, fecha_registro, estado_cuenta) values
('jinx_storm', 5, 12500, 450, 85, 68.50, '2026-01-15 14:30:00', 'activo'),
('shadow_sniper', 4, 6200, 320, 42, 75.20, '2026-02-10 18:45:00', 'activo'),
('carlos_pro', 3, 3100, 210, 25, 55.40, '2026-03-01 09:15:00', 'activo'),
('maria_fps', 2, 1800, 150, 12, 48.90, '2026-03-20 20:00:00', 'activo'),
('anderson_x', 1, 450, 80, 4, 35.10, '2026-04-05 16:20:00', 'activo'),
('allison_queen', 4, 5400, 290, 38, 71.80, '2026-02-28 11:10:00', 'activo'),
('iker_gamer', 3, 2800, 190, 19, 59.30, '2026-03-12 13:50:00', 'suspendido'),
('cleidy_aim', 5, 11000, 410, 72, 82.40, '2026-01-20 22:05:00', 'activo');