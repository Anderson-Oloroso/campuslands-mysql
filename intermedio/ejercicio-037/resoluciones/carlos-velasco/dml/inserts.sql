USE campuslands_mysql;

INSERT INTO equipos (
    nombre,
    ciudad,
    estadio,
    estado
) VALUES
('Academia FC', 'Ciudad de Guatemala', 'Estadio Central', 'activo'),
('Guatemala United', 'Guatemala', 'Estadio Nacional', 'activo'),
('Capitalinos FC', 'Guatemala', 'Estadio Metropolitano', 'activo'),
('Aurora Deportiva', 'Mixco', 'Estadio Aurora', 'activo');


INSERT INTO jugadores (
    id_equipo,
    nombre,
    posicion,
    numero_camiseta
) VALUES
(1, 'Diego Morales', 'portero', 1),
(1, 'Carlos Ramirez', 'defensa', 4),
(1, 'Mateo Castillo', 'mediocampista', 8),
(1, 'Luis Herrera', 'delantero', 9),
(2, 'Andres Lopez', 'portero', 1),
(2, 'Jorge Mendoza', 'defensa', 5),
(2, 'Daniel Perez', 'mediocampista', 10),
(2, 'Sergio Castillo', 'delantero', 11);


INSERT INTO partidos (
    equipo_local_id,
    equipo_visitante_id,
    fecha,
    goles_local,
    goles_visitante
) VALUES
(1, 2, '2026-08-01', 2, 1),
(3, 4, '2026-08-02', 1, 1),
(2, 3, '2026-08-08', 0, 2),
(4, 1, '2026-08-09', 2, 3),
(1, 3, '2026-08-15', 1, 0),
(2, 4, '2026-08-16', 2, 2);


INSERT INTO estadisticas_partido (
    partido_id,
    jugador_id,
    minutos_jugados,
    goles,
    asistencias,
    tarjetas_amarillas
) VALUES
(1, 1, 90, 0, 0, 0),
(1, 2, 90, 0, 0, 1),
(1, 3, 90, 0, 1, 0),
(1, 4, 88, 2, 0, 0),
(1, 5, 90, 0, 0, 0),
(1, 6, 90, 0, 0, 1),
(1, 7, 90, 0, 1, 0),
(1, 8, 90, 1, 0, 0),

(2, 1, 90, 0, 0, 0),
(2, 2, 90, 0, 0, 0),
(2, 5, 90, 0, 0, 1),
(2, 6, 90, 0, 0, 0),

(3, 5, 90, 0, 0, 0),
(3, 6, 90, 0, 0, 1),
(3, 7, 90, 1, 0, 0),
(3, 8, 90, 1, 1, 0),

(4, 1, 90, 0, 0, 0),
(4, 2, 90, 0, 0, 1),
(4, 3, 90, 1, 1, 0),
(4, 4, 90, 2, 0, 0),

(5, 1, 90, 0, 0, 0),
(5, 2, 90, 0, 0, 0),
(5, 3, 90, 0, 1, 0),
(5, 4, 90, 1, 0, 0),

(6, 5, 90, 0, 0, 0),
(6, 6, 90, 0, 0, 1),
(6, 7, 90, 1, 1, 0),
(6, 8, 90, 1, 0, 0);