-- DML: Registro de 8+ elementos por entidad para alimentar las Vistas
USE campuslands_mysql;

-- Inserción de Equipos
INSERT INTO equipos_liga_avanzado (nombre_equipo, ciudad, fundacion_anio) VALUES
('Real Chapín FC', 'Guatemala', 1950),
('Comunicaciones City', 'Guatemala', 1949),
('Deportivo Xela', 'Quetzaltenango', 1942),
('Cobán Imperial', 'Alta Verapaz', 1935),
('Antigua GFC', 'Sacatepéquez', 1958);

-- Inserción de Jugadores (Mínimo 8 registros)
INSERT INTO jugadores_liga_avanzado (equipo_id, nombre_jugador, posicion, goles_anotados) VALUES
(1, 'Carlos Ruiz', 'delantero', 12),
(1, 'Marco Pappa', 'centrocampista', 5),
(2, 'Jose Contreras', 'centrocampista', 7),
(2, 'Juan Anangonó', 'delantero', 9),
(3, 'Darwin Lom', 'delantero', 8),
(3, 'Hector Moreira', 'defensa', 2),
(4, 'Janderson Pereira', 'delantero', 11),
(5, 'Oscar Santis', 'delantero', 6);

-- Inserción de Partidos
INSERT INTO partidos_liga_avanzado (equipo_local_id, equipo_visitante_id, goles_local, goles_visitante, fecha_partido, estado) VALUES
(1, 2, 2, 1, '2026-03-01', 'finalizado'),
(3, 4, 1, 1, '2026-03-02', 'finalizado'),
(5, 1, 0, 3, '2026-03-05', 'finalizado'),
(2, 3, 4, 2, '2026-03-06', 'finalizado'),
(4, 5, 2, 0, '2026-03-08', 'finalizado'),
(1, 3, 0, 0, '2026-03-12', 'programado');
