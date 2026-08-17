-- Datos de practica para liga de futbol (10 registros por tabla).
USE campuslands_mysql;

INSERT INTO intermedio_ejercicio_007_jugadores (nombre, posicion) 
    VALUES ('Lionel Messi', 'Delantero'),
    ('Cristiano Ronaldo', 'Delantero'),
    ('Kevin De Bruyne', 'Mediocampista'),
    ('Virgil van Dijk', 'Defensa'),
    ('Thibaut Courtois', 'Portero'),
    ('Luka Modric', 'Mediocampista'),
    ('Kylian Mbappe', 'Delantero'),
    ('Sergio Ramos', 'Defensa'),
    ('Neymar Jr', 'Delantero'),
    ('Casemiro', 'Mediocampista');

INSERT INTO intermedio_ejercicio_007_partidos (jornada, rival, fecha) 
    VALUES (1, 'Real Madrid', '2026-08-10'),
    (2, 'FC Barcelona', '2026-08-17'),
    (3, 'Manchester City', '2026-08-24'),
    (4, 'Bayern Munich', '2026-08-31'),
    (5, 'PSG', '2026-09-07'),
    (6, 'Juventus', '2026-09-14'),
    (7, 'Liverpool', '2026-09-21'),
    (8, 'Chelsea', '2026-09-28'),
    (9, 'AC Milan', '2026-10-05'),
    (10, 'Inter de Milan', '2026-10-12');
INSERT INTO intermedio_ejercicio_007_rendimiento (jugador_id, partido_id, minutos_jugados, goles) 
    VALUES (1, 1, 90, 2),
    (2, 1, 90, 1),
    (3, 1, 85, 0),
    (1, 2, 90, 1),
    (7, 2, 75, 2),
    (5, 3, 90, 0),
    (4, 3, 90, 0),
    (9, 4, 60, 1),
    (6, 4, 90, 0),
    (8, 5, 90, 1),
    (10, 5, 80, 0),
    (1, 6, 90, 3),
    (2, 6, 45, 0),
    (3, 7, 90, 1);