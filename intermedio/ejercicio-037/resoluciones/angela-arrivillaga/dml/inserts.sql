use liga_futbol_2fn_db;

insert into equipos (nombre_equipo, ciudad, estadio) values
('Real Academia FC', 'Bogotá', 'Estadio Metropolitano Campus'),
('Cybernetic United', 'Medellín', 'Arena Digital'),
('Neon Strikers SC', 'Cali', 'Estadio Luminoso'),
('Valkyrie Athletic', 'Barranquilla', 'Coloso del Norte'),
('Titanium FC', 'Bucaramanga', 'Estadio Monumental Bucara'),
('Shadow Phantoms CF', 'Cartagena', 'Estadio Amurallado');

insert into torneos (nombre_torneo, anio, semestre) values
('Liga Campus Apertura 2026', 2026, 'apertura'),
('Liga Campus Clausura 2026', 2026, 'clausura');

insert into participaciones_torneo (id_torneo, id_equipo, puntos_obtenidos, partidos_jugados, goles_a_favor, goles_en_contra) values
(1, 1, 35, 16, 28, 12),
(1, 2, 32, 16, 25, 15),
(1, 3, 28, 16, 22, 18),
(1, 4, 24, 16, 19, 20),
(1, 5, 20, 16, 16, 25),
(1, 6, 15, 16, 12, 30),
(2, 1, 18, 8, 15, 6),
(2, 2, 16, 8, 14, 8),
(2, 3, 14, 8, 11, 9),
(2, 4, 12, 8, 10, 11);

insert into jugadores_futbol (id_equipo, nombre_jugador, posicion, dorsal, goles_anotados) values
(1, 'Angela Arrivillaga', 'delantero', 10, 14),
(1, 'Iker Dahinten', 'mediocampista', 8, 7),
(2, 'Allison Vargas', 'delantero', 9, 12),
(2, 'Jayce Talis', 'defensa', 4, 3),
(3, 'Cleidy Mosquera', 'arquero', 1, 0),
(3, 'Viktor Machine', 'mediocampista', 7, 5),
(4, 'Evelin Romero', 'delantero', 11, 8),
(5, 'Anderson Perez', 'defensa', 2, 2),
(6, 'Carlos Mendoza', 'delantero', 7, 4);