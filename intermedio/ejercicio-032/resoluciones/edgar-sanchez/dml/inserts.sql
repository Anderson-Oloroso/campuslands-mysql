-- Datos de practica. Puedes cambiarlos o agregar mas filas.
USE campuslands_mysql;


INSERT INTO rangos_temporada (nombre_rango, puntos_minimos, puntos_maximos) VALUES
('Bronce', 0, 999),
('Plata', 1000, 2499),
('Oro', 2500, 4999),
('Diamante', 5000, 9999),
('Depredador Apex', 10000, 99999);

INSERT INTO jugadores_br (rango_id, nickname, correo, nivel_cuenta, fecha_registro) VALUES
(5, 'GhostSniper', 'ghost.sniper@brgame.com', 320, '2026-01-05'),
(4, 'ValkyriePrime', 'valkyrie.prime@brgame.com', 215, '2026-01-12'),
(3, 'ShadowNinja', 'shadow.ninja@brgame.com', 95, '2026-02-01'),
(2, 'NoobMaster99', 'noobmaster99@brgame.com', 12, '2026-03-10'),
(1, 'RookieZone', 'rookie.zone@brgame.com', 5, '2026-04-01');

INSERT INTO partidas_br (codigo_partida, modo_juego, mapa, duracion_segundos, fecha_partida) VALUES
('BR-MATCH-001', 'Solo', 'Isla Tormenta', 1450, '2026-04-10 18:00:00'),
('BR-MATCH-002', 'Squads', 'Cañón Desértico', 1820, '2026-04-10 19:30:00'),
('BR-MATCH-003', 'Solo', 'Isla Tormenta', 1200, '2026-04-12 21:00:00');

INSERT INTO resultados_jugador_partida (partida_id, jugador_id, posicion_final, eliminaciones, dano_infligido, puntos_rank_obtenidos) VALUES
(1, 1, 1, 12, 2850, 150),
(1, 2, 5, 4, 1100, 45),
(1, 3, 22, 1, 350, -10),
(2, 1, 1, 8, 1950, 120),
(2, 2, 2, 6, 1600, 85),
(3, 2, 1, 9, 2100, 140);