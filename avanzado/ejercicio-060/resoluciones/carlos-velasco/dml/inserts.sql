USE campuslands_mysql;

INSERT INTO equipo_streaming (
    nombre,
    usuario_streaming,
    plataforma,
    rol,
    seguidores,
    horas_stream_mes,
    estado,
    fecha_ingreso
) VALUES
(
    'Carlos Mendoza',
    'carlosplays',
    'Twitch',
    'streamer',
    185000,
    72.50,
    'activo',
    '2025-01-15'
),
(
    'Sofia Ramirez',
    'sofiagames',
    'YouTube',
    'streamer',
    245000,
    64.00,
    'activo',
    '2024-11-20'
),
(
    'Diego Castillo',
    'diegolive',
    'Twitch',
    'streamer',
    132000,
    58.75,
    'activo',
    '2025-03-10'
),
(
    'Valeria Torres',
    'valetv',
    'Kick',
    'streamer',
    98000,
    51.25,
    'activo',
    '2025-04-05'
),
(
    'Andres Morales',
    'andresmod',
    'Twitch',
    'moderador',
    12000,
    35.50,
    'activo',
    '2025-02-18'
),
(
    'Camila Herrera',
    'camilacuts',
    'YouTube',
    'editor',
    28000,
    42.00,
    'activo',
    '2025-05-12'
),
(
    'Mateo Vargas',
    'mateomanager',
    'Kick',
    'manager',
    15000,
    30.00,
    'activo',
    '2024-10-08'
),
(
    'Laura Gomez',
    'laurastream',
    'Twitch',
    'streamer',
    76000,
    46.50,
    'activo',
    '2025-06-22'
),
(
    'Daniel Rojas',
    'daniedits',
    'YouTube',
    'editor',
    19000,
    38.25,
    'inactivo',
    '2024-08-14'
),
(
    'Natalia Perez',
    'natymod',
    'Twitch',
    'moderador',
    8500,
    27.75,
    'activo',
    '2025-07-01'
);