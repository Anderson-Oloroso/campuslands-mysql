USE futbol_sala_3fn_db;

-- Inserción de ciudades maestras (3FN)
INSERT INTO ciudades (nombre_ciudad, pais) VALUES
('Madrid', 'España'),
('Barcelona', 'España'),
('Murcia', 'España'),
('Palma de Mallorca', 'España'),
('Jaén', 'España'),
('Cartagena', 'España'),
('Valdepeñas', 'España'),
('Pamplona', 'España');

-- Inserción de 8 equipos de fútbol sala vinculados a sus respectivas ciudades normalizadas
INSERT INTO equipos_sala (nombre_equipo, id_ciudad, pabellon) VALUES
('Inter Movistar', 1, 'Pabellón Jorge Garbajosa'),
('Barça Futsal', 2, 'Palau Blaugrana'),
('ElPozo Murcia', 3, 'Palacio de los Deportes de Murcia'),
('Palma Futsal', 4, 'Son Moix'),
('Jaén Paraíso', 5, 'Olivo Arena'),
('Jimbee Cartagena', 6, 'Palacio de Deportes de Cartagena'),
('Viña Albali', 7, 'Pabellón Complex Deportivo Sur'),
('Ribera Navarra', 8, 'Anaitasuna');

-- Inserción de 8 registros de partidos transaccionales
INSERT INTO partidos_sala (id_equipo_local, id_equipo_visitante, goles_local, goles_visitante, fecha_partido, estado_partido) VALUES
(1, 2, 4, 3, '2026-07-01', 'Finalizado'),
(3, 4, 2, 2, '2026-07-04', 'Finalizado'),
(5, 6, 5, 1, '2026-07-08', 'Finalizado'),
(7, 8, 3, 0, '2026-07-10', 'Finalizado'),
(2, 3, 6, 4, '2026-07-14', 'Finalizado'),
(4, 1, 2, 3, '2026-07-18', 'Finalizado'),
(6, 7, 1, 1, '2026-07-21', 'Finalizado'),
(8, 5, 0, 0, '2026-07-25', 'Programado');
