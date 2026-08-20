-- ============================================================
-- EJERCICIO 037 - VISTAS AVANZADAS PARA LIGA DE FUTBOL
-- DML - Insercion de datos
-- ============================================================

USE campuslands_mysql;

-- ------------------------------------------------------------
-- Equipos
-- ------------------------------------------------------------

INSERT INTO equipos
    (nombre, ciudad, estadio, estado)
VALUES
    ('Titanes FC', 'Bogota', 'Estadio Titan', 'activo'),
    ('Andes United', 'Medellin', 'Estadio Andes', 'activo'),
    ('Costa Azul FC', 'Cartagena', 'Arena Costa Azul', 'activo'),
    ('Capital Stars', 'Cali', 'Estadio Capital', 'activo'),
    ('Lobos del Norte', 'Barranquilla', 'Estadio del Norte', 'activo'),
    ('Racing Central', 'Bucaramanga', 'Arena Central', 'activo');

-- ------------------------------------------------------------
-- Jugadores
-- ------------------------------------------------------------

INSERT INTO jugadores
    (equipo_id, nombre, posicion, edad, goles, asistencias)
VALUES
    (1, 'Mateo Rojas', 'delantero', 24, 8, 4),
    (1, 'Daniel Torres', 'mediocampista', 27, 3, 7),

    (2, 'Samuel Castro', 'delantero', 23, 10, 3),
    (2, 'Nicolas Vera', 'mediocampista', 26, 4, 6),

    (3, 'Julian Mendoza', 'delantero', 25, 7, 5),
    (3, 'Andres Pardo', 'defensa', 29, 2, 2),

    (4, 'Sebastian Leon', 'delantero', 22, 6, 4),
    (4, 'Felipe Marin', 'mediocampista', 28, 5, 8),

    (5, 'Diego Suarez', 'delantero', 26, 9, 2),
    (5, 'Carlos Mena', 'defensa', 30, 1, 3),

    (6, 'Esteban Gil', 'delantero', 24, 5, 5),
    (6, 'Luis Herrera', 'mediocampista', 27, 3, 6);

-- ------------------------------------------------------------
-- Partidos
-- ------------------------------------------------------------

INSERT INTO partidos
    (
        equipo_local_id,
        equipo_visitante_id,
        fecha_partido,
        goles_local,
        goles_visitante,
        estado
    )
VALUES
    (1, 2, '2026-07-01', 2, 1, 'finalizado'),
    (3, 4, '2026-07-02', 1, 1, 'finalizado'),
    (5, 6, '2026-07-03', 3, 2, 'finalizado'),

    (2, 3, '2026-07-08', 2, 0, 'finalizado'),
    (4, 5, '2026-07-09', 0, 1, 'finalizado'),
    (6, 1, '2026-07-10', 2, 2, 'finalizado'),

    (1, 3, '2026-07-15', 1, 0, 'finalizado'),
    (2, 4, '2026-07-16', 3, 2, 'finalizado'),
    (5, 1, '2026-07-17', 1, 1, 'finalizado'),

    (3, 6, '2026-07-22', 2, 3, 'finalizado'),
    (4, 1, '2026-07-23', 2, 2, 'finalizado'),
    (6, 2, '2026-07-24', 1, 0, 'finalizado');