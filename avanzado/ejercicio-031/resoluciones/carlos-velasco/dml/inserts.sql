USE campuslands_mysql;

INSERT INTO partidas_moba (
    equipo_rojo,
    equipo_azul,
    ganador,
    mapa,
    duracion_minutos,
    fecha_partida,
    estado
) VALUES
(
    'Dragons Elite',
    'Shadow Wolves',
    'Dragons Elite',
    'Summoners Rift',
    34,
    '2026-08-01 18:00:00',
    'finalizada'
),
(
    'Cyber Titans',
    'Nova Squad',
    'Nova Squad',
    'Summoners Rift',
    29,
    '2026-08-01 19:00:00',
    'finalizada'
),
(
    'Dragons Elite',
    'Cyber Titans',
    'Cyber Titans',
    'Summoners Rift',
    41,
    '2026-08-02 18:00:00',
    'finalizada'
),
(
    'Shadow Wolves',
    'Nova Squad',
    'Shadow Wolves',
    'Summoners Rift',
    37,
    '2026-08-02 20:00:00',
    'finalizada'
),
(
    'Dragons Elite',
    'Nova Squad',
    NULL,
    'Summoners Rift',
    1,
    '2026-08-03 18:00:00',
    'en_curso'
),
(
    'Cyber Titans',
    'Shadow Wolves',
    NULL,
    'Summoners Rift',
    0,
    '2026-08-03 20:00:00',
    'programada'
),
(
    'Nova Squad',
    'Dragons Elite',
    'Nova Squad',
    'Summoners Rift',
    32,
    '2026-08-04 18:00:00',
    'finalizada'
),
(
    'Shadow Wolves',
    'Cyber Titans',
    'Cyber Titans',
    'Summoners Rift',
    39,
    '2026-08-04 20:00:00',
    'finalizada'
),
(
    'Dragons Elite',
    'Shadow Wolves',
    'Shadow Wolves',
    'Summoners Rift',
    45,
    '2026-08-05 18:00:00',
    'finalizada'
),
(
    'Nova Squad',
    'Cyber Titans',
    NULL,
    'Summoners Rift',
    0,
    '2026-08-05 20:00:00',
    'programada'
);