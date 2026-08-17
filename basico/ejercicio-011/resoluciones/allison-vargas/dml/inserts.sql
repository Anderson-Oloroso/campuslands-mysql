-- DML: Inserción de participantes de Ping-Pong cumpliendo las reglas de validación
USE campuslands_mysql;

INSERT INTO torneos_pingpong (nombre_jugador, categoria, partidos_jugados, partidos_ganados, puntos_ranking, estado) VALUES
('Carlos Morales', 'Mayores', 10, 8, 1450, 'campeon'),
('Lucía Fernández', 'Mayores', 10, 7, 1380, 'eliminado'),
('Diego Ramírez', 'Sub-18', 8, 6, 1200, 'inscrito'),
('Andrea Salazar', 'Sub-18', 9, 8, 1250, 'campeon'),
('Roberto Gómez', 'Veteranos', 5, 2, 1100, 'eliminado'),
('Mario Estrada', 'Veteranos', 6, 4, 1150, 'inscrito'),
('Sofia Paiz', 'Mayores', 7, 5, 1310, 'inscrito'),
('Gabriel Arriola', 'Sub-18', 4, 1, 1050, 'descalificado');
