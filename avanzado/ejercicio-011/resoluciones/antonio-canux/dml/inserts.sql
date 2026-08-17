-- Datos de practica para pingpong (CTE).

USE campuslands_mysql;

INSERT INTO avanzado_ejercicio_011_jugadores (nombre, pais, ranking_mundial) 
    VALUES ('Wang Chuqin', 'China', 1),
    ('Fan Zhendong', 'China', 2),
    ('Ma Long', 'China', 3),
    ('Hugo Calderano', 'Brasil', 4),
    ('Felix Lebrun', 'Francia', 5),
    ('Lin Yun-Ju', 'Taiwan', 6);

INSERT INTO avanzado_ejercicio_011_partidos (jugador1_id, jugador2_id, sets_jugador1, sets_jugador2, fecha_partido) 
    VALUES (1, 2, 4, 3, '2026-08-10'),
    (3, 4, 4, 1, '2026-08-11'),
    (5, 6, 2, 4, '2026-08-11'),
    (1, 3, 4, 2, '2026-08-12'),
    (4, 6, 4, 3, '2026-08-12'),
    (2, 5, 4, 0, '2026-08-13'),
    (1, 6, 4, 1, '2026-08-14'),
    (2, 4, 3, 4, '2026-08-15');