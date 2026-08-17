-- Datos de practica: sesiones de juego de un videojuego de accion y aventura.
USE campuslands_mysql;

INSERT INTO sesiones_juego_intermedio (jugador, dificultad, nivel_alcanzado, enemigos_derrotados, muertes, duracion_min, fecha_sesion) VALUES
('Kael', 'dificil', 5, 30, 2, 45, '2026-01-05'),
('Kael', 'dificil', 6, 25, 0, 50, '2026-01-15'),
('Vex', 'normal', 4, 20, 5, 35, '2026-01-10'),
('Vex', 'normal', 5, 22, 3, 40, '2026-02-01'),
('Aris', 'facil', 3, 15, 0, 25, '2026-01-20'),
('Kael', 'dificil', 7, 35, 1, 55, '2026-02-05'),
('Vex', 'dificil', 6, 18, 6, 30, '2026-02-15'),
('Aris', 'normal', 5, 20, 0, 38, '2026-02-20'),
('Kael', 'dificil', 8, 40, 3, 60, '2026-03-01'),
('Aris', 'normal', 6, 25, 1, 42, '2026-03-05');
