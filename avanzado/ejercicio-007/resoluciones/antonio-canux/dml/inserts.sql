-- Datos de practica para liga de futbol (Equipos, Jugadores y Estadisticas).
USE campuslands_mysql;

INSERT INTO avanzado_ejercicio_007_equipos (nombre, ciudad, fundacion) 
    VALUES ('Municipal', 'Ciudad de Guatemala', 1936),
    ('Comunicaciones', 'Ciudad de Guatemala', 1949),
    ('Antigua GFC', 'Antigua Guatemala', 1958),
    ('Xelaju MC', 'Quetzaltenango', 1942),
    ('Coban Imperial', 'Coban', 1924);

INSERT INTO avanzado_ejercicio_007_jugadores (equipo_id, nombre, posicion) 
    VALUES (1, 'Ramiro Rocca', 'Delantero'),
    (1, 'Jose Carlos Martinez', 'Delantero'),
    (2, 'Jose Corena', 'Mediocampista'),
    (2, 'Fredy Perez', 'Portero'),
    (3, 'Oscar Santis', 'Delantero'),
    (3, 'Jose Ardón', 'Defensa'),
    (4, 'Darwin Lom', 'Delantero'),
    (4, 'Kenner Gutierrez', 'Defensa'),
    (5, 'Janderson Pereira', 'Delantero'),
    (5, 'Minor Alvarez', 'Portero');

INSERT INTO avanzado_ejercicio_007_estadisticas (jugador_id, partidos_jugados, goles, asistencias, tarjetas_amarillas) 
    VALUES (1, 15, 12, 3, 2),
    (2, 14, 8, 4, 1),
    (3, 15, 3, 7, 4),
    (4, 15, 0, 0, 1),
    (5, 12, 6, 5, 2),
    (6, 14, 1, 2, 5),
    (7, 10, 5, 1, 3),
    (8, 13, 2, 0, 6),
    (9, 15, 9, 4, 1),
    (10, 15, 0, 1, 0);