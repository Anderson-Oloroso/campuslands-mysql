USE db_futbol_sala;

INSERT INTO equipos_sala (nombre, puntos, goles_favor, estado) VALUES
('Inter FS', 13, 22, 'Activo'),
('Barça Futsal', 12, 25, 'Activo'),
('ElPozo', 10, 18, 'Activo'),
('Palma', 9, 16, 'Activo'),
('Jaén', 8, 14, 'Activo'),
('Valdepeñas', 6, 12, 'Activo'),
('Ribera', 4, 10, 'Activo'),
('Córdoba', 3, 9, 'Activo');

UPDATE equipos_sala SET estado = 'Clasificado' WHERE puntos >= 10;
UPDATE equipos_sala SET puntos = puntos - 3 WHERE nombre = 'Ribera';
UPDATE equipos_sala SET puntos = puntos + 3, goles_favor = goles_favor + 2 WHERE nombre = 'Palma';