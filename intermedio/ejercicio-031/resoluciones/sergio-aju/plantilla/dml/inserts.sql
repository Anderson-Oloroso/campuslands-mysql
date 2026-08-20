USE campuslands_mysql;

-- Inserción de Equipos (Tabla Padre)
INSERT INTO equipos_moba (nombre_equipo, region, tag_abreviado, puntos_liga, estado_equipo) VALUES
('Team Liquid', 'América del Norte', 'TL', 24, 'clasificado'),
('G2 Esports', 'Europa', 'G2', 27, 'clasificado'),
('T1', 'Corea del Sur', 'T1', 30, 'clasificado'),
('Fnatic', 'Europa', 'FNC', 21, 'clasificado');

-- Inserción de Jugadores (Tabla Hija - Mínimo 8 registros distribuidos entre los equipos)
INSERT INTO jugadores_moba (nickname, nombre_real, rol, equipo_id, asesinatos_totales, muertes_totales, asistencias_totales) VALUES
('Faker', 'Lee Sang-hyeok', 'Mid Laner', 3, 85, 20, 110),
('Zeus', 'Choi Woo-je', 'Top Laner', 3, 62, 35, 80),
('Caps', 'Rasmus Borregaard', 'Mid Laner', 2, 75, 40, 95),
('BrokenBlade', 'Sergen Çelik', 'Top Laner', 2, 58, 45, 70),
('Impact', 'Jung Eon-young', 'Top Laner', 1, 40, 30, 85),
('Pyosik', 'Hong Chang-hyeon', 'Jungler', 1, 50, 42, 105),
('Humanoid', 'Marek Brázda', 'Mid Laner', 4, 65, 38, 90),
('Noah', 'Oh Hyeon-taek', 'ADC', 4, 80, 28, 60);