INSERT INTO clubes_pingpong (nombre_club, ciudad, fecha_fundacion) VALUES
('Spin & Drive Club', 'Guatemala', '2018-03-15'),
('Topspin Academy', 'Quetzaltenango', '2020-06-10'),
('Smash Table Tennis', 'Antigua Guatemala', '2019-11-01');

INSERT INTO jugadores_pingpong (club_id, nombre_jugador, ranking_nacional, mano_dominante) VALUES
(1, 'Marcos Morales', 1, 'Derecha'),
(1, 'Diego Salazar', 4, 'Izquierda'),
(2, 'Rodrigo Castillo', 2, 'Derecha'),
(2, 'Andrés Flores', 5, 'Derecha'),
(3, 'Mateo Álvarez', 3, 'Izquierda');

INSERT INTO torneos_pingpong (nombre_torneo, categoria, fecha_inicio) VALUES
('Torneo Nacional de Pingpong 2026', 'Primera Division', '2026-02-10'),
('Copa Verano Tenis de Mesa', 'Primera Division', '2026-05-18');

INSERT INTO partidos_pingpong (torneo_id, jugador1_id, jugador2_id, sets_jugador1, sets_jugador2, duracion_minutos) VALUES
(1, 1, 3, 3, 1, 42),
(1, 2, 4, 3, 2, 38),
(1, 1, 2, 3, 0, 25),
(1, 3, 5, 3, 1, 35),
(2, 1, 5, 3, 2, 50),
(2, 2, 3, 1, 3, 40),
(2, 4, 1, 0, 3, 28);