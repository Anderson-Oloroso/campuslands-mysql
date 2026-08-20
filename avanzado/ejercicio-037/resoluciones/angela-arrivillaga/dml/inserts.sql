use campuslands_mysql;

-- insercion de equipos de la liga
insert into equipos (nombre, ciudad) values
('real madrid', 'madrid'),
('fc barcelona', 'barcelona'),
('atletico madrid', 'madrid'),
('sevilla fc', 'sevilla'),
('valencia cf', 'valencia');

-- insercion de resultados de partidos
insert into partidos (equipo_local_id, equipo_visitante_id, goles_local, goles_visitante, fecha_partido) values
(1, 2, 3, 1, '2026-08-01'),
(3, 4, 2, 0, '2026-08-02'),
(5, 1, 1, 1, '2026-08-05'),
(2, 3, 4, 2, '2026-08-10'),
(4, 5, 0, 0, '2026-08-12'),
(1, 3, 2, 1, '2026-08-15'),
(2, 4, 3, 0, '2026-08-18'),
(5, 2, 1, 2, '2026-08-20');