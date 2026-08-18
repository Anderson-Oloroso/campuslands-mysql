use campuslands_mysql;

-- insercion de 8 registros de equipos
insert into equipos_liga (nombre_equipo, ciudad_origen, estado) values
('real madrid', 'madrid', 'activo'),
('fc barcelona', 'barcelona', 'activo'),
('atletico de madrid', 'madrid', 'activo'),
('athletic club', 'bilbao', 'activo'),
('villarreal cf', 'villarreal', 'activo'),
('real sociedad', 'san sebastian', 'activo'),
('real betis', 'sevilla', 'sancionado'),
('valencia cf', 'valencia', 'activo');

-- insercion de registros de estadios
insert into estadios (nombre_estadio, capacidad) values
('santiago bernabeu', 81044),
('spotify camp nou', 99354),
('civitas metropolitano', 70460),
('san mames', 53289),
('estadio de la ceramica', 23500);

-- insercion de 8 registros de partidos (cumpliendo con la estructura 2fn)
insert into partidos_liga (equipo_local_id, equipo_visitante_id, estadio_id, goles_local, goles_visitante, jornada) values
(1, 2, 1, 2, 1, 1),
(3, 4, 3, 1, 1, 1),
(5, 6, 5, 3, 0, 1),
(7, 8, 4, 0, 2, 1),
(2, 3, 2, 2, 2, 2),
(4, 1, 4, 0, 3, 2),
(6, 7, 5, 1, 0, 2),
(8, 5, 4, 1, 1, 2);