use torneos_moba_db;

insert into equipos_moba (nombre_equipo, tag_equipo, region, estado_equipo) values
('Arcane Outlaws', 'AO', 'LCK', 'activo'),
('Piltover Enforcers', 'PE', 'LEC', 'activo'),
('Zaun Chembarons', 'ZC', 'LCS', 'activo'),
('Ionia Blades', 'IB', 'LPL', 'campeon'),
('Noxian Legion', 'NL', 'LCK', 'eliminado'),
('Shurima Ascendants', 'SA', 'LEC', 'activo'),
('Targon Celestials', 'TC', 'LCS', 'eliminado'),
('Shadow Isles Wraiths', 'SI', 'LPL', 'activo');

insert into jugadores_moba (id_equipo, nombre_jugador, nickname, rol_principal, kda_promedio) values
(1, 'Angela Arrivillaga', 'JinxMain', 'adc', 4.85),
(1, 'Iker Dahinten', 'EkkoTime', 'jungle', 3.90),
(2, 'Allison Vargas', 'CaitSniper', 'adc', 5.10),
(2, 'Jayce Talis', 'HammerJayce', 'top', 4.20),
(3, 'Cleidy Mosquera', 'ViPunch', 'jungle', 3.75),
(4, 'Viktor Machine', 'GloriousEvo', 'mid', 5.50),
(5, 'Anderson Perez', 'DariusDunk', 'top', 2.90),
(6, 'Evelin Romero', 'AzirSun', 'mid', 4.15);

insert into partidas_moba (id_equipo_azul, id_equipo_rojo, id_ganador, duracion_minutos, fase_torneo, fecha_partida) values
(1, 2, 1, 32, 'fase de grupos', '2026-06-10 15:00:00'),
(3, 4, 4, 28, 'fase de grupos', '2026-06-10 17:00:00'),
(5, 6, 6, 41, 'cuartos de final', '2026-06-15 14:30:00'),
(7, 8, 8, 35, 'cuartos de final', '2026-06-15 18:00:00'),
(1, 4, 4, 39, 'semifinal', '2026-06-20 16:00:00'),
(2, 6, 2, 30, 'semifinal', '2026-06-20 19:00:00'),
(4, 2, 4, 45, 'gran final', '2026-06-25 18:30:00'),
(3, 1, 3, 27, 'partido por el tercer lugar', '2026-06-25 14:00:00');