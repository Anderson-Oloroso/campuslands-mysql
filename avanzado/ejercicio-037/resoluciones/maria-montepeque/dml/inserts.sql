-- Datos de practica: partidos y goles de una liga de futbol.
USE campuslands_mysql;

INSERT INTO partidos_avanzado (equipo_local, equipo_visitante, fecha_partido, estadio, estado) VALUES
('Aguilas Doradas', 'Tigres del Sur', '2026-05-10', 'Estadio Norte', 'jugado'),
('Leones FC', 'Aguilas Doradas', '2026-05-24', 'Estadio Centro', 'jugado'),
('Tigres del Sur', 'Leones FC', '2026-06-07', 'Estadio Sur', 'jugado'),
('Aguilas Doradas', 'Leones FC', '2026-06-21', 'Estadio Norte', 'programado'),
('Tigres del Sur', 'Aguilas Doradas', '2026-07-05', 'Estadio Sur', 'suspendido');

INSERT INTO goles_avanzado (id_partido, jugador, equipo, minuto, tipo_gol) VALUES
(1, 'Mateo Rivas', 'Aguilas Doradas', 15, 'normal'),
(1, 'Diego Palma', 'Tigres del Sur', 33, 'normal'),
(1, 'Mateo Rivas', 'Aguilas Doradas', 78, 'penal'),
(2, 'Nico Farias', 'Leones FC', 10, 'normal'),
(2, 'Santi Belmonte', 'Aguilas Doradas', 45, 'normal'),
(2, 'Nico Farias', 'Leones FC', 60, 'penal'),
(3, 'Ruben Casal', 'Tigres del Sur', 20, 'autogol'),
(3, 'Andres Roble', 'Leones FC', 55, 'normal'),
(3, 'Andres Roble', 'Leones FC', 90, 'penal');

-- Actualizacion a traves de la vista actualizable: sigue cumpliendo
-- estado = 'jugado' despues del cambio, asi que WITH CHECK OPTION
-- la permite sin problema.
UPDATE vw_partidos_jugados_avanzado
SET estadio = 'Estadio Norte Remodelado'
WHERE id_partido = 1;
