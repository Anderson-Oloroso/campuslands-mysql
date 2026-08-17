INSERT INTO jugadores (nombre, edad, categoria, puntos_ranking) VALUES
('Carlos Mendoza', 17, 'Sub-18', 1250),
('Sofia Lopez', 16, 'Sub-18', 1400),
('Mateo Gomez', 18, 'Mayores', 1100),
('Lucia Fernandez', 15, 'Sub-18', 950),
('Diego Ramirez', 21, 'Mayores', 1600);

INSERT INTO partidos (jugador_1_id, jugador_2_id, puntos_j1, puntos_j2, fecha_partido) VALUES
(1, 2, 11, 9, '2026-08-10'),
(3, 4, 8, 11, '2026-08-11'),
(5, 1, 11, 7, '2026-08-12'),
(2, 3, 11, 5, '2026-08-13'),
(4, 5, 6, 11, '2026-08-14');
