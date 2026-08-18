USE campuslands_mysql;

INSERT INTO transmisiones (
    nombre_streamer,
    plataforma,
    categoria,
    espectadores,
    duracion_minutos,
    fecha_transmision,
    estado
) VALUES
(
    'AlexByte',
    'Twitch',
    'Videojuegos',
    2450,
    180,
    '2026-08-01 18:00:00',
    'finalizada'
),
(
    'LunaTech',
    'YouTube',
    'Tecnologia',
    1820,
    150,
    '2026-08-02 19:30:00',
    'finalizada'
),
(
    'GameMaster',
    'Twitch',
    'Videojuegos',
    5200,
    240,
    '2026-08-03 20:00:00',
    'finalizada'
),
(
    'PixelZone',
    'Kick',
    'Videojuegos',
    3100,
    210,
    '2026-08-04 21:00:00',
    'finalizada'
),
(
    'CodeLive',
    'YouTube',
    'Programacion',
    950,
    120,
    '2026-08-05 17:00:00',
    'finalizada'
),
(
    'StreamPro',
    'Twitch',
    'Tecnologia',
    2750,
    200,
    '2026-08-06 18:30:00',
    'finalizada'
),
(
    'RetroPlayer',
    'Kick',
    'Videojuegos',
    1250,
    175,
    '2026-08-07 20:30:00',
    'finalizada'
),
(
    'DevMaster',
    'YouTube',
    'Programacion',
    1400,
    135,
    '2026-08-08 16:00:00',
    'finalizada'
),
(
    'TechWorld',
    'Twitch',
    'Tecnologia',
    3600,
    225,
    '2026-08-09 19:00:00',
    'activa'
),
(
    'GameArena',
    'Twitch',
    'Videojuegos',
    4300,
    260,
    '2026-08-10 21:00:00',
    'finalizada'
);