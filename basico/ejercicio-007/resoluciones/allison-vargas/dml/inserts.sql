-- DML: Registro de 8 equipos con estadísticas variadas para pruebas de ordenamiento
USE campuslands_mysql;

INSERT INTO equipos_liga_basico 
(nombre_equipo, ciudad, puntos, partidos_jugados, goles_favor, goles_contra, estado) 
VALUES
('Real Chapín FC', 'Guatemala', 28, 12, 24, 10, 'activo'),
('Comunicaciones City', 'Guatemala', 25, 12, 22, 12, 'activo'),
('Deportivo Xela', 'Quetzaltenango', 22, 12, 18, 14, 'activo'),
('Cobán Imperial', 'Alta Verapaz', 19, 12, 15, 15, 'activo'),
('Antigua GFC', 'Sacatepéquez', 18, 12, 16, 17, 'activo'),
('Deportivo Malacateco', 'San Marcos', 14, 12, 12, 19, 'activo'),
('Guastatoya FC', 'El Progreso', 10, 12, 9, 21, 'activo'),
('Universidad San Carlos', 'Guatemala', 5, 12, 7, 25, 'sancionado');
