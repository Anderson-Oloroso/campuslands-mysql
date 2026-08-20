USE campuslands_mysql;

-- Inserción de al menos 8 registros de equipos profesionales de esports MOBA con datos realistas
INSERT INTO equipos_moba (nombre_equipo, region, tag_abreviado, partidos_jugados, partidos_ganados, partidos_perdidos, puntos_liga, estado_equipo) VALUES
('Team Liquid', 'América del Norte', 'TL', 10, 8, 2, 24, 'clasificado'),
('Cloud9', 'América del Norte', 'C9', 10, 6, 4, 18, 'activo'),
('Fnatic', 'Europa', 'FNC', 10, 7, 3, 21, 'clasificado'),
('G2 Esports', 'Europa', 'G2', 10, 9, 1, 27, 'clasificado'),
('T1', 'Corea del Sur', 'T1', 10, 10, 0, 30, 'clasificado'),
('Gen.G', 'Corea del Sur', 'GEN', 10, 8, 2, 24, 'clasificado'),
('PSG Talon', 'Asia-Pacífico', 'PSG', 10, 4, 6, 12, 'activo'),
('Pain Gaming', 'Latinoamérica', 'PNG', 10, 2, 8, 6, 'eliminado');