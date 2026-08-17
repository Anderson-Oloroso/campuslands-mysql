-- DML: Carga de datos cumpliendo las dependencias funcionales de la 2FN
USE campuslands_mysql;

-- Inserción de Estadios
INSERT INTO estadios_liga (nombre_estadio, ciudad, capacidad) VALUES
('Estadio Doroteo Guamuch Flores', 'Guatemala', 26000),
('Estadio Mario Camposeco', 'Quetzaltenango', 11200),
('Estadio Pensativo', 'Sacatepéquez', 10000),
('Estadio José Ángel Rossi', 'Alta Verapaz', 15000);

-- Inserción de Equipos
INSERT INTO equipos_liga_intermedio (nombre_equipo, director_tecnico, estado) VALUES
('Real Chapín FC', 'Amarini Villatoro', 'activo'),
('Comunicaciones City', 'Willy Coito', 'activo'),
('Deportivo Xela', 'Amarini Villatoro', 'activo'),
('Cobán Imperial', 'Roberto Montoya', 'activo');

-- Inserción en la tabla de rendimiento (Mínimo 8 registros de relación)
INSERT INTO rendimiento_equipos_estadio (equipo_id, estadio_id, partidos_jugados, partidos_ganados, goles_anotados) VALUES
(1, 1, 10, 7, 18),
(1, 2, 4, 1, 3),
(2, 1, 10, 6, 15),
(2, 3, 3, 2, 5),
(3, 2, 12, 9, 22),
(3, 1, 5, 2, 4),
(4, 4, 11, 8, 20),
(4, 3, 4, 1, 2);
