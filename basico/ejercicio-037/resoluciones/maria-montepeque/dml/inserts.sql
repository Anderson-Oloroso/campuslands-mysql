-- Datos de practica: jugadores de varios equipos de una liga de futbol.
USE campuslands_mysql;

INSERT INTO jugadores_basico (nombre, equipo, posicion, goles, edad, salario, estado) VALUES
('Mateo Rivas', 'Aguilas Doradas', 'delantero', 18, 27, 45000.00, 'activo'),
('Santi Belmonte', 'Aguilas Doradas', 'mediocampista', 6, 24, 32000.00, 'activo'),
('Diego Palma', 'Tigres del Sur', 'delantero', 15, 29, 42000.00, 'lesionado'),
('Ruben Casal', 'Tigres del Sur', 'defensa', 1, 31, 28000.00, 'activo'),
('Nico Farias', 'Leones FC', 'delantero', 21, 26, 50000.00, 'activo'),
('Andres Roble', 'Leones FC', 'mediocampista', 9, 23, 30000.00, 'suspendido'),
('Camilo Duarte', 'Halcones United', 'portero', 0, 30, 26000.00, 'activo'),
('Julian Mesa', 'Halcones United', 'defensa', 2, 22, 24000.00, 'activo'),
('Felipe Nogales', 'Aguilas Doradas', 'portero', 0, 33, 27000.00, 'activo');
