USE db_liga_futbol;

-- Inserción de al menos 8 registros útiles y realistas para probar ordenamientos múltiples
INSERT INTO equipos (nombre_equipo, ciudad, partidos_jugados, puntos, goles_favor, goles_contra, estado) VALUES
('Real Madrid', 'Madrid', 20, 52, 45, 15, 'Activo'),
('FC Barcelona', 'Barcelona', 20, 49, 42, 18, 'Activo'),
('Atlético de Madrid', 'Madrid', 20, 40, 35, 20, 'Activo'),
('Athletic Club', 'Bilbao', 20, 35, 30, 22, 'Activo'),
('Real Sociedad', 'San Sebastián', 20, 32, 28, 25, 'Activo'),
('Real Betis', 'Sevilla', 20, 30, 26, 28, 'Activo'),
('Valencia CF', 'Valencia', 20, 25, 22, 30, 'Activo'),
('Villarreal CF', 'Villarreal', 20, 24, 25, 33, 'Activo'),
('Getafe CF', 'Getafe', 20, 22, 18, 32, 'Activo'),
('Cádiz CF', 'Cádiz', 20, 15, 14, 40, 'Suspendido');