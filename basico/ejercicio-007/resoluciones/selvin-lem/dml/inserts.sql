USE campuslands_mysql;

INSERT INTO liga_futbol_posiciones (nombre_equipo, partidos_jugados, puntos, goles_favor, goles_contra, fecha_ultimo_partido, estado) VALUES
('Aguilas FC',      10, 24, 28, 12, '2026-07-01', 'activo'),
('Tigres Unidos',   10, 24, 22, 10, '2026-07-01', 'activo'),
('Leones del Sur',  10, 21, 18, 15, '2026-07-02', 'activo'),
('Halcones FC',     10, 21, 20, 16, '2026-07-02', 'activo'),
('Panteras Negras', 10, 18, 15, 15, '2026-06-30', 'activo'),
('Cobras Azules',   10, 15, 12, 18, '2026-06-29', 'sancionado'),
('Toros Bravos',    10, 12, 10, 20, '2026-06-28', 'activo'),
('Lobos FC',        10, 0,  5,  30, '2026-06-25', 'activo');