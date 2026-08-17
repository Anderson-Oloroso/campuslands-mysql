-- Datos de practica: reproducciones de canciones de una playlist musical.
-- El tiempo escuchado va subiendo con cada reproduccion (el usuario se
-- engancha mas con la cancion), para que las funciones de ventana
-- tengan datos con tendencia real.
USE campuslands_mysql;

INSERT INTO reproducciones_avanzado (usuario, cancion, segundos_escuchados, resultado, duracion_total_seg, fecha) VALUES
('Kael', 'Luces de la Ciudad', 60, 'saltada', 210, '2026-01-05'),
('Kael', 'Luces de la Ciudad', 130, 'saltada', 210, '2026-01-08'),
('Kael', 'Luces de la Ciudad', 210, 'completa', 210, '2026-01-12'),
('Kael', 'Ritmo Tropical', 195, 'completa', 195, '2026-02-01'),
('Vex', 'Luces de la Ciudad', 50, 'saltada', 210, '2026-01-06'),
('Vex', 'Luces de la Ciudad', 120, 'saltada', 210, '2026-01-10'),
('Vex', 'Luces de la Ciudad', 210, 'completa', 210, '2026-01-14'),
('Vex', 'Ritmo Tropical', 160, 'saltada', 195, '2026-02-03'),
('Vex', 'Ritmo Tropical', 195, 'completa', 195, '2026-02-10'),
('Aris', 'Luces de la Ciudad', 45, 'saltada', 210, '2026-01-07'),
('Aris', 'Ritmo Tropical', 170, 'saltada', 195, '2026-02-02'),
('Aris', 'Ritmo Tropical', 195, 'completa', 195, '2026-02-09');
