-- Datos de practica: equipos y partidas de un torneo esports MOBA.
USE campuslands_mysql;

INSERT INTO equipos_intermedio (nombre_equipo, region) VALUES
('Furia Andina', 'LATAM'),
('Nightfall Esports', 'NA'),
('Dragones del Norte', 'EU'),
('Phoenix Rising', 'KR'),
('Shadow Wolves', 'CN');

INSERT INTO partidas_intermedio (id_equipo_local, id_equipo_visitante, marcador_local, marcador_visitante, fase, fecha) VALUES
(1, 2, 2, 1, 'grupos', '2026-01-10'),
(3, 4, 1, 2, 'grupos', '2026-01-11'),
(5, 1, 2, 0, 'grupos', '2026-01-12'),
(2, 3, 2, 1, 'grupos', '2026-01-13'),
(4, 5, 2, 1, 'grupos', '2026-01-14'),
(1, 3, 2, 0, 'cuartos', '2026-01-20'),
(2, 4, 1, 2, 'cuartos', '2026-01-21'),
(1, 2, 2, 1, 'semifinal', '2026-02-01'),
(1, 4, 2, 1, 'final', '2026-02-10');
