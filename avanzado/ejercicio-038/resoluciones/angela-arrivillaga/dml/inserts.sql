use campuslands_mysql;

-- insercion de equipos de futbol sala
insert into equipos_sala (nombre, entrenador, puntos, goles_favor, goles_contra, estado) values
('inter movistar', 'velasco', 22, 35, 12, 'activo'),
('el pozo murcia', 'dudu', 19, 28, 15, 'activo'),
('barcelona f.s.', 'tino perez', 25, 40, 10, 'activo'),
('palma futsal', 'antonio vadillo', 16, 22, 18, 'activo'),
('jaen paraiso interior', 'daniel rodriguez', 14, 20, 20, 'activo'),
('viña albali valdepenas', 'david ramos', 11, 18, 25, 'activo'),
('ribera navarra', 'lucas fernandez', 8, 15, 30, 'suspendido'),
('cordoba patrimonio', 'emanuel santoro', 6, 12, 32, 'eliminado');

-- insercion de jugadores destacados por equipo
insert into jugadores_sala (equipo_id, nombre, dorsal, goles_anotados, tarjetas_amarillas, tarjetas_rojas) values
(1, 'ricardinho', 10, 12, 2, 0),
(1, 'boyis', 13, 3, 4, 1),
(2, 'valerio', 8, 9, 1, 0),
(3, 'ferrao', 11, 15, 3, 0),
(3, 'lozano', 9, 7, 5, 0),
(4, 'cainan', 6, 6, 2, 0),
(5, 'chino', 10, 11, 3, 1),
(6, 'catela', 7, 5, 1, 0);