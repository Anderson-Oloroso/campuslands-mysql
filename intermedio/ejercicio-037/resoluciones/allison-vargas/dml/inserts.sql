USE liga_futbol_2fn_db;

-- Inserción de 8 equipos
INSERT INTO equipos (nombre_equipo, ciudad, estadio) VALUES
('Real Madrid', 'Madrid', 'Santiago Bernabéu'),
('FC Barcelona', 'Barcelona', 'Spotify Camp Nou'),
('Atlético de Madrid', 'Madrid', 'Cívitas Metropolitano'),
('Sevilla FC', 'Sevilla', 'Ramón Sánchez-Pizjuán'),
('Real Sociedad', 'San Sebastián', 'Reale Arena'),
('Villarreal CF', 'Villarreal', 'Estadio de la Cerámica'),
('Athletic Club', 'Bilbao', 'San Mamés'),
('Real Betis', 'Sevilla', 'Benito Villamarín');

-- Inserción de 8 jugadores vinculados a los equipos (Cumpliendo 2FN)
INSERT INTO jugadores (id_equipo, nombre_jugador, posicion, dorsal) VALUES
(1, 'Kylian Mbappé', 'Delantero', 9),
(2, 'Robert Lewandowski', 'Delantero', 9),
(3, 'Antoine Griezmann', 'Centrocampista', 7),
(4, 'Duván Zapata', 'Delantero', 91),
(5, 'Takefusa Kubo', 'Centrocampista', 14),
(6, 'Gerard Moreno', 'Delantero', 7),
(7, 'Nico Williams', 'Centrocampista', 11),
(8, 'Isco Alarcón', 'Centrocampista', 22);

-- Inserción de 8 registros de rendimiento asociados a los jugadores
INSERT INTO rendimiento_partidos (id_jugador, goles_anotados, asistencias, tarjetas_amarillas, minutos_jugados) VALUES
(1, 2, 1, 0, 90),
(2, 3, 0, 1, 90),
(3, 1, 2, 0, 85),
(4, 1, 0, 2, 90),
(5, 1, 3, 0, 80),
(6, 2, 1, 1, 90),
(7, 1, 4, 0, 88),
(8, 0, 3, 1, 75);
