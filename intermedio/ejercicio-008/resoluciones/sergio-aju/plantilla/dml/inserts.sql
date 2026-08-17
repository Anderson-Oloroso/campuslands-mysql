-- DML: Inserción de datos realistas para pruebas y filtros
USE futbol_sala_db;

-- Insertar Equipos
INSERT INTO equipos (id_equipo, nombre_equipo, categoria, ciudad) VALUES
(1, 'Leones FS', 'Masculino A', 'Guatemala'),
(2, 'FC Galácticos', 'Masculino A', 'Mixco'),
(3, 'Dinamo Futsal', 'Masculino B', 'Villa Nueva');

-- Insertar Jugadores (Más de 8 registros)
INSERT INTO jugadores (id_jugador, nombre_completo, posicion, dorsal, id_equipo, estado) VALUES
(1, 'Carlos Ramirez', 'Pívot', 9, 1, 'Activo'),
(2, 'Esteban Morales', 'Ala', 10, 1, 'Activo'),
(3, 'Mario Pinto', 'Portero', 1, 1, 'Activo'),
(4, 'Alejandro Gomez', 'Cierre', 5, 2, 'Activo'),
(5, 'Roberto Cifuentes', 'Pívot', 11, 2, 'Activo'),
(6, 'Kevin Lopez', 'Ala', 7, 2, 'Lesionado'),
(7, 'Diego Estrada', 'Ala', 8, 3, 'Activo'),
(8, 'Luis Fernando', 'Cierre', 4, 3, 'Activo'),
(9, 'Andres Pineda', 'Portero', 12, 3, 'Activo');

-- Insertar Estadísticas de Partidos (Para cálculos, promedios y rankings)
INSERT INTO estadisticas_partido (id_jugador, goles_anotados, asistencias, tarjetas_amarillas, tarjetas_rojas, calificacion_partido, fecha_partido) VALUES
(1, 3, 1, 0, 0, 9.2, '2026-07-10'),
(2, 1, 4, 1, 0, 8.5, '2026-07-10'),
(4, 2, 0, 0, 0, 8.0, '2026-07-12'),
(5, 4, 1, 0, 0, 9.8, '2026-07-12'),
(7, 0, 2, 2, 1, 5.5, '2026-07-14'),
(8, 1, 1, 1, 0, 7.2, '2026-07-14'),
(1, 2, 2, 0, 0, 8.9, '2026-07-18'),
(5, 1, 2, 1, 0, 8.1, '2026-07-18');