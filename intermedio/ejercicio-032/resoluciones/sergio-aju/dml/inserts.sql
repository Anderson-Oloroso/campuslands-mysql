USE campuslands_mysql;

-- Inserción de Clanes (Tabla Padre - Incluyendo 'Shadow syndicate' que no tendrá jugadores para probar LEFT JOIN)
INSERT INTO clanes_royale (nombre_clan, tag_clan, nivel_clan, fecha_creacion) VALUES
('Apex Predators', 'APEX', 5, '2025-01-15'),
('Neon Syndicate', 'NEON', 4, '2025-03-10'),
('Phantom Wolves', 'WOLF', 3, '2025-06-20'),
('Shadow Syndicate', 'SHDW', 2, '2026-01-10'); -- Clan sin jugadores asociados para demostrar el LEFT JOIN

-- Inserción de Jugadores (Tabla Hija - Mínimo 8 registros, algunos con clan_id y otros con NULL para jugadores solitarios)
INSERT INTO jugadores_royale (jugador_nickname, clan_id, partidas_jugadas, victorias, eliminaciones, puntos_ranking, estado_cuenta) VALUES
('ShadowKiller', 1, 250, 45, 820, 3450, 'activo'),
('ViperQueen', 1, 180, 30, 590, 2890, 'activo'),
('SniperGhost', 2, 310, 60, 1150, 4200, 'veterano'),
('StormBringer', 2, 120, 15, 340, 1750, 'activo'),
('CyberNinja', 3, 90, 8, 210, 1200, 'suspendido'),
('AlphaWolf', 3, 400, 85, 1420, 5100, 'veterano'),
('LoneSurvivor', NULL, 150, 22, 490, 2150, 'activo'), -- Jugador solitario (sin clan)
('GhostRider', NULL, 200, 28, 630, 2400, 'activo');   -- Jugador solitario (sin clan)