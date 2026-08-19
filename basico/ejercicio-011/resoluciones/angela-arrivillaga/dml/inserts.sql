USE pingpong_db;

INSERT INTO jugadores (nombre, nivel, puntos_ranking, activo) VALUES
('Ma Long', 'avanzado', 2500, TRUE),
('Fan Zhendong', 'avanzado', 2450, TRUE),
('Dimitrij Ovtcharov', 'intermedio', 1800, TRUE),
('Timo Boll', 'intermedio', 1850, TRUE),
('Hugo Calderano', 'intermedio', 1700, TRUE),
('Tomokazu Harimoto', 'avanzado', 2100, TRUE),
('Felix Lebrun', 'principiante', 1400, TRUE),
('Truls Moregard', 'principiante', 1350, FALSE);

INSERT INTO partidos (id_jugador1, id_jugador2, sets_jugador1, sets_jugador2, fecha_partido) VALUES
(1, 2, 4, 3, '2026-08-01'),
(3, 4, 2, 4, '2026-08-02'),
(5, 6, 1, 4, '2026-08-03'),
(7, 8, 4, 0, '2026-08-04'),
(1, 3, 4, 1, '2026-08-05'),
(2, 4, 4, 2, '2026-08-06'),
(6, 7, 3, 4, '2026-08-07'),
(5, 8, 4, 2, '2026-08-08');