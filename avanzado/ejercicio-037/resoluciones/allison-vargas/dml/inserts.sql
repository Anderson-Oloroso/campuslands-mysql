USE liga_futbol_vistas_db;

-- Inserción de 8 equipos de la liga
INSERT INTO equipos (nombre_equipo, ciudad, estadio, fundacion_año) VALUES
('Real Madrid', 'Madrid', 'Santiago Bernabéu', 1902),
('FC Barcelona', 'Barcelona', 'Spotify Camp Nou', 1899),
('Atlético de Madrid', 'Madrid', 'Cívitas Metropolitano', 1903),
('Sevilla FC', 'Sevilla', 'Ramón Sánchez-Pizjuán', 1890),
('Real Sociedad', 'San Sebastián', 'Reale Arena', 1909),
('Villarreal CF', 'Villarreal', 'Estadio de la Cerámica', 1923),
('Athletic Club', 'Bilbao', 'San Mamés', 1898),
('Real Betis', 'Sevilla', 'Benito Villamarín', 1907);

-- Inserción de 8 registros de partidos realistas
INSERT INTO partidos (id_equipo_local, id_equipo_visitante, goles_local, goles_visitante, fecha_partido, estado) VALUES
(1, 2, 3, 2, '2026-07-01', 'Finalizado'),
(3, 4, 1, 1, '2026-07-05', 'Finalizado'),
(5, 6, 2, 0, '2026-07-10', 'Finalizado'),
(7, 8, 0, 2, '2026-07-12', 'Finalizado'),
(2, 3, 4, 2, '2026-07-15', 'Finalizado'),
(4, 1, 1, 3, '2026-07-18', 'Finalizado'),
(6, 7, 2, 2, '2026-07-20', 'Finalizado'),
(8, 5, 1, 0, '2026-07-22', 'Programado');
