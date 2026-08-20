USE campuslands_mysql;

-- Inserción de al menos 8 registros de jugadores profesionales para pruebas iniciales
INSERT INTO jugadores_royale_avanzado (jugador_nickname, partidas_jugadas, victorias, eliminaciones, puntos_ranking, estado_cuenta) VALUES
('ShadowKiller', 250, 45, 820, 3450, 'activo'),
('ViperQueen', 180, 30, 590, 2890, 'activo'),
('SniperGhost', 310, 60, 1150, 4200, 'veterano'),
('StormBringer', 120, 15, 340, 1750, 'activo'),
('CyberNinja', 90, 8, 210, 1200, 'suspendido'),
('AlphaWolf', 400, 85, 1420, 5100, 'veterano'),
('TitanSlayer', 210, 25, 610, 2300, 'activo'),
('PhoenixRider', 150, 20, 480, 2100, 'activo');