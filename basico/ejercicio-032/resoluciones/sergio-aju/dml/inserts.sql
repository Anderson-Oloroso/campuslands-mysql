USE campuslands_mysql;

-- Inserción de al menos 8 registros realistas de jugadores de battle royale
INSERT INTO ranking_battle_royale (jugador_nickname, plataforma, partidas_jugadas, victorias, eliminaciones, precision_tiro, puntos_ranking, fecha_ultimo_registro, estado_cuenta) VALUES
('ShadowKiller', 'PC', 250, 45, 820, 68.50, 3450, '2026-08-15', 'activo'),
('ViperQueen', 'PlayStation', 180, 30, 590, 62.40, 2890, '2026-08-16', 'activo'),
('SniperGhost', 'PC', 310, 60, 1150, 75.20, 4200, '2026-08-17', 'veterano'),
('StormBringer', 'Xbox', 120, 15, 340, 54.10, 1750, '2026-08-10', 'activo'),
('CyberNinja', 'Mobile', 90, 8, 210, 48.90, 1200, '2026-08-05', 'suspendido'),
('AlphaWolf', 'PC', 400, 85, 1420, 71.80, 5100, '2026-08-18', 'veterano'),
('TitanSlayer', 'PlayStation', 210, 25, 610, 59.30, 2300, '2026-08-12', 'activo'),
('PhoenixRider', 'Xbox', 150, 20, 480, 65.00, 2100, '2026-08-14', 'activo');