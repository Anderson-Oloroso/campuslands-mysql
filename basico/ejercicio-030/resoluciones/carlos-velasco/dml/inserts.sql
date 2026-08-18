USE campuslands_mysql;

INSERT INTO streamers (
    nombre,
    canal,
    plataforma,
    estado
) VALUES
(
    'Alex Gamer',
    'AlexGamerLive',
    'Twitch',
    'activo'
),
(
    'Luna Tech',
    'LunaTech',
    'YouTube',
    'activo'
),
(
    'DarkPlayer',
    'DarkPlayerGG',
    'Twitch',
    'activo'
),
(
    'Neko Stream',
    'NekoStream',
    'Kick',
    'inactivo'
),
(
    'Pixel Master',
    'PixelMasterTV',
    'YouTube',
    'activo'
);

INSERT INTO equipos_streaming (
    id_streamer,
    nombre_equipo,
    tipo_equipo,
    precio,
    fecha_adquisicion
) VALUES
(
    1,
    'PC Gaming Ryzen 7',
    'Computador',
    1850.00,
    '2026-01-15'
),
(
    1,
    'Microfono HyperX',
    'Microfono',
    145.00,
    '2026-01-20'
),
(
    2,
    'PC Streaming Core i7',
    'Computador',
    2100.00,
    '2026-02-05'
),
(
    2,
    'Camara Logitech Brio',
    'Camara',
    180.00,
    '2026-02-10'
),
(
    3,
    'PC Gaming RTX',
    'Computador',
    2450.00,
    '2026-01-28'
),
(
    3,
    'Auriculares SteelSeries',
    'Auriculares',
    210.00,
    '2026-02-01'
),
(
    4,
    'Microfono USB',
    'Microfono',
    95.00,
    '2025-12-15'
),
(
    4,
    'Webcam Full HD',
    'Camara',
    120.00,
    '2025-12-20'
),
(
    5,
    'PC Creator',
    'Computador',
    1950.00,
    '2026-03-05'
),
(
    5,
    'Microfono Profesional',
    'Microfono',
    275.00,
    '2026-03-08'
);