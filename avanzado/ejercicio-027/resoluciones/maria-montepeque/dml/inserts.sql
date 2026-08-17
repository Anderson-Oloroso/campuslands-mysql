-- Datos de practica: enfrentamientos contra jefes de un videojuego de accion y aventura.
-- El daño va subiendo con cada intento (curva de aprendizaje del jugador),
-- para que las funciones de ventana tengan datos con tendencia real.
USE campuslands_mysql;

INSERT INTO enfrentamientos_avanzado (jugador, jefe, danio_infligido, resultado, duracion_seg, fecha) VALUES
('Kael', 'Dragon de Obsidiana', 1200, 'derrota', 180, '2026-01-05'),
('Kael', 'Dragon de Obsidiana', 1500, 'derrota', 200, '2026-01-08'),
('Kael', 'Dragon de Obsidiana', 2100, 'victoria', 240, '2026-01-12'),
('Kael', 'Senor de las Sombras', 1800, 'derrota', 150, '2026-02-01'),
('Vex', 'Dragon de Obsidiana', 1000, 'derrota', 160, '2026-01-06'),
('Vex', 'Dragon de Obsidiana', 1400, 'derrota', 190, '2026-01-10'),
('Vex', 'Dragon de Obsidiana', 1900, 'victoria', 220, '2026-01-14'),
('Vex', 'Senor de las Sombras', 1600, 'derrota', 140, '2026-02-03'),
('Vex', 'Senor de las Sombras', 2200, 'victoria', 210, '2026-02-10'),
('Aris', 'Dragon de Obsidiana', 900, 'derrota', 150, '2026-01-07'),
('Aris', 'Senor de las Sombras', 1700, 'derrota', 145, '2026-02-02'),
('Aris', 'Senor de las Sombras', 2000, 'victoria', 200, '2026-02-09');
