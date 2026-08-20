USE liga_futbol;

INSERT INTO equipos (nombre, ciudad, fecha_fundacion) VALUES
('Águilas Doradas', 'Rionegro', '2008-07-25'),
('Millonarios', 'Bogotá', '1946-06-18'),
('Atlético Nacional', 'Medellín', '1947-04-30'),
('Junior FC', 'Barranquilla', '1924-08-07');

INSERT INTO partidos (id_equipo_local, id_equipo_visitante, goles_local, goles_visitante, fecha_partido, estado) VALUES
(1, 2, 2, 1, '2026-01-10 20:00:00', 'finalizado'),
(3, 4, 0, 0, '2026-01-11 18:00:00', 'finalizado'),
(2, 3, 3, 2, '2026-01-15 19:30:00', 'finalizado'),
(4, 1, 1, 1, '2026-01-16 20:00:00', 'finalizado'),
(1, 3, 1, 2, '2026-02-01 17:00:00', 'finalizado'),
(2, 4, 4, 0, '2026-02-05 20:00:00', 'finalizado'),
(3, 1, 2, 2, '2026-02-10 19:00:00', 'finalizado'),
(4, 2, 0, 2, '2026-02-12 20:30:00', 'finalizado');