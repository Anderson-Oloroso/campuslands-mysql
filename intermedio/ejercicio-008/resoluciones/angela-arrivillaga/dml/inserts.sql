use campuslands_mysql;

insert into posiciones_sala (nombre_posicion, descripcion) values
('cierre', 'organiza la defensa desde atras y corta avances rivales'),
('ala', 'ocupa las bandas para desbordar y apoyar en defensa y ataque'),
('pivot', 'delantero centro que juega de espaldas a la porteria rival'),
('portero', 'encargado de evitar que el balon cruce la linea de gol');

insert into equipos_sala (nombre_equipo, ciudad, estado) values
('inter movistar', 'madrid', 'activo'),
('el pozo murcia', 'murcia', 'activo'),
('barca futsal', 'barcelona', 'activo'),
('palma futsal', 'palma', 'activo'),
('jaen paraiso interior', 'jaen', 'activo'),
('valdepenas fs', 'ciudad real', 'activo'),
('ribera navarra', 'tudela', 'inactivo'),
('cordoba patrimonio', 'cordoba', 'activo');

insert into jugadores_sala (nombre_completo, numero_camiseta, equipo_id, posicion_id, goles_anotados) values
('jesus herrero', 1, 1, 4, 0),
('ricardinho', 10, 1, 2, 14),
('valerio', 7, 2, 3, 18),
('ferrao', 11, 3, 3, 22),
('marlon', 13, 4, 1, 5),
('carlos brandi', 8, 4, 2, 12),
('antonio perez', 6, 3, 1, 4),
('lucas roque', 9, 5, 2, 9);