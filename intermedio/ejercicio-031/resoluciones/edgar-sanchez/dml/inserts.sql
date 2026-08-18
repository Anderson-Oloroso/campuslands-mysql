-- Datos de practica. Puedes cambiarlos o agregar mas filas.
USE campuslands_mysql;

INSERT INTO equipos_esports (nombre_equipo, tag_equipo, region, fecha_fundacion) VALUES
('T1 Gaming', 'T1', 'LCK (Corea)', '2003-12-13'),
('G2 Esports', 'G2', 'LEC (Europa)', '2014-02-24'),
('Cloud9', 'C9', 'LCS (Norteamérica)', '2013-01-08'),
('Top Esports', 'TES', 'LPL (China)', '2017-12-21');

INSERT INTO jugadores_moba (equipo_id, nickname, nombre_completo, rol_juego, nacionalidad) VALUES
(1, 'Faker', 'Lee Sang-hyeok', 'Mid', 'Coreana'),
(1, 'Zeus', 'Choi Woo-je', 'Top', 'Coreana'),
(2, 'Caps', 'Rasmus Winther', 'Mid', 'Danesa'),
(2, 'Jankos', 'Marcin Jankowski', 'Jungle', 'Polaca'),
(3, 'Blaber', 'Robert Huang', 'Jungle', 'Estadounidense'),
(4, 'JackeyLove', 'Yu Wen-Bo', 'ADC', 'China');

INSERT INTO torneos_moba (nombre_torneo, fase, premio_total_usd, fecha_inicio) VALUES
('World Championship 2026', 'Gran Final', 2225000.00, '2026-10-01'),
('Mid-Season Invitational 2026', 'Semifinales', 250000.00, '2026-05-01');

INSERT INTO partidas_torneo (torneo_id, equipo_azul_id, equipo_rojo_id, equipo_ganador_id, duracion_segundos, fecha_partida) VALUES
(1, 1, 2, 1, 2140, '2026-10-15 14:00:00'),
(1, 3, 4, 4, 1850, '2026-10-15 15:30:00'),
(1, 1, 4, 1, 2410, '2026-10-20 18:00:00'),
(2, 2, 3, 2, 1980, '2026-05-10 16:00:00');

INSERT INTO estadisticas_jugador_partida (partida_id, jugador_id, campeon_usado, asesinatos, muertes, asistencias, oro_obtenido) VALUES
(1, 1, 'Azir', 7, 1, 8, 16500),
(1, 2, 'Aatrox', 4, 2, 6, 14200),
(1, 3, 'Sylas', 2, 5, 3, 11800),
(1, 4, 'Lee Sin', 1, 4, 4, 10500),
(2, 5, 'Kindred', 1, 6, 2, 9800),
(2, 6, 'Kaisa', 9, 0, 5, 18100),
(3, 1, 'Ahri', 6, 2, 10, 15900),
(3, 6, 'Ezreal', 3, 4, 2, 13400);