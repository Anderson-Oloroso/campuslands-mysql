USE campuslands_mysql;

INSERT INTO misiones (
    nombre,
    categoria,
    nivel,
    puntaje,
    estado,
    fecha_inicio,
    fecha_fin
)
VALUES
(
    'Exploracion de Kepler-442b',
    'Exploracion',
    5,
    82.50,
    'finalizada',
    '2026-08-01 08:00:00',
    '2026-08-05 18:00:00'
),
(
    'Defensa de la Estacion Nova',
    'Defensa',
    8,
    95.00,
    'finalizada',
    '2026-08-03 10:00:00',
    '2026-08-07 22:00:00'
),
(
    'Rescate en Titan',
    'Rescate',
    7,
    91.75,
    'finalizada',
    '2026-08-05 09:30:00',
    '2026-08-10 16:30:00'
),
(
    'Cartografia de Andromeda',
    'Exploracion',
    4,
    76.25,
    'finalizada',
    '2026-08-08 07:00:00',
    '2026-08-12 20:00:00'
),
(
    'Infiltracion en la Flota Zeta',
    'Inteligencia',
    9,
    98.50,
    'finalizada',
    '2026-08-10 21:00:00',
    '2026-08-14 23:00:00'
),
(
    'Proteccion del Colonizador',
    'Defensa',
    6,
    88.00,
    'activa',
    '2026-08-17 08:00:00',
    '2026-08-20 18:00:00'
),
(
    'Evacuacion de Europa',
    'Rescate',
    10,
    99.25,
    'activa',
    '2026-08-18 06:00:00',
    '2026-08-22 21:00:00'
),
(
    'Reconocimiento de Marte',
    'Exploracion',
    3,
    72.50,
    'programada',
    '2026-08-25 09:00:00',
    '2026-08-28 17:00:00'
),
(
    'Interceptacion del Crucero Orion',
    'Inteligencia',
    8,
    94.75,
    'programada',
    '2026-08-27 14:00:00',
    '2026-08-30 19:00:00'
),
(
    'Alianza con los Centauri',
    'Diplomacia',
    2,
    68.00,
    'programada',
    '2026-09-01 10:00:00',
    '2026-09-04 15:00:00'
);