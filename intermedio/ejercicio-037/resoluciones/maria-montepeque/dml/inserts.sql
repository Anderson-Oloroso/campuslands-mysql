-- Datos de practica: jugadores, partidos y goles de una liga de futbol.
-- Cada gol es una fila propia enlazada por FK, sin repetir datos del
-- jugador ni del partido (2FN).
USE campuslands_mysql;

INSERT INTO jugadores_intermedio (nombre, equipo) VALUES
('Mateo Rivas', 'Aguilas Doradas'),
('Santi Belmonte', 'Aguilas Doradas'),
('Diego Palma', 'Tigres del Sur'),
('Ruben Casal', 'Tigres del Sur'),
('Nico Farias', 'Leones FC'),
('Andres Roble', 'Leones FC');

INSERT INTO partidos_intermedio (equipo_local, equipo_visitante, fecha_partido, estadio) VALUES
('Aguilas Doradas', 'Tigres del Sur', '2026-05-10', 'Estadio Norte'),
('Leones FC', 'Aguilas Doradas', '2026-05-24', 'Estadio Centro'),
('Tigres del Sur', 'Leones FC', '2026-06-07', 'Estadio Sur'),
('Aguilas Doradas', 'Leones FC', '2026-06-21', 'Estadio Norte');

INSERT INTO goles_partido_intermedio (id_partido, id_jugador, minuto, tipo_gol) VALUES
(1, 1, 15, 'normal'),
(1, 3, 33, 'normal'),
(1, 1, 78, 'penal'),
(2, 5, 10, 'normal'),
(2, 2, 45, 'normal'),
(2, 5, 60, 'normal'),
(3, 4, 20, 'autogol'),
(3, 6, 55, 'normal'),
(4, 1, 5, 'normal'),
(4, 1, 88, 'normal'),
(4, 6, 40, 'normal'),
(4, 5, 90, 'penal');
