use ranking_battle_royale_db;

insert into escuadrones_br (nombre_escuadron, servidor_region, nivel_rango) values
('Apex Legends BR', 'NA-East', 'gran maestro'),
('Cybernetic Wolves', 'EU-West', 'maestro'),
('Shadow Phantoms', 'SA-East', 'platino'),
('Neon Strikers', 'NA-West', 'diamante'),
('Valkyrie Squad', 'ASIA', 'oro'),
('Phoenix Syndicate', 'EU-Central', 'platino'),
('Titanium Legion', 'SA-South', 'maestro'),
('Ghost Operatives', 'NA-East', 'diamante');

insert into jugadores_br (id_escuadron, nombre_jugador, gamertag, eliminaciones_totales, partidas_jugadas) values
(1, 'Angela Arrivillaga', 'JinxBR_99', 342, 120),
(1, 'Iker Dahinten', 'EkkoTime_BR', 285, 115),
(2, 'Allison Vargas', 'CaitSniper_X', 410, 140),
(2, 'Jayce Talis', 'Hammer_BR', 195, 90),
(3, 'Cleidy Mosquera', 'ViPunch_BR', 220, 105),
(4, 'Viktor Machine', 'EvoMachine', 315, 130),
(5, 'Evelin Romero', 'AzirSun_BR', 150, 80),
(6, 'Anderson Perez', 'Darius_BR', 180, 95),
(null, 'Carlos Mendoza', 'LoneWolf_Solo', 95, 50),
(null, 'Sam Drake', 'UnassignedPlayer', 60, 30);
insert into partidas_br (mapa_juego, modo_juego, ganador_gamertag, duracion_minutos, fecha_partida) values
('Bermuda', 'squad', 'JinxBR_99', 22, '2026-06-10 20:00:00'),
('Caldera', 'squad', 'CaitSniper_X', 25, '2026-06-12 21:15:00'),
('Erangel', 'solo', 'LoneWolf_Solo', 19, '2026-06-15 18:30:00'),
('Livik', 'duo', 'EkkoTime_BR', 17, '2026-06-18 19:45:00'),
('Bermuda', 'squad', 'EvoMachine', 24, '2026-06-20 22:00:00'),
('Caldera', 'squad', 'CaitSniper_X', 21, '2026-06-22 20:30:00'),
('Erangel', 'squad', 'ViPunch_BR', 23, '2026-06-25 21:00:00'),
('Livik', 'solo', 'UnassignedPlayer', 18, '2026-06-28 17:15:00');