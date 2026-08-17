USE campuslands_mysql;


INSERT INTO misiones (
    nombre,
    planeta_origen,
    comandante,
    nivel_riesgo,
    estado,
    fecha_inicio,
    fecha_fin
) VALUES
(
    'Operación Nebulosa',
    'Nova Prime',
    'Elena Vargas',
    'alto',
    'en_curso',
    '2026-08-10 08:00:00',
    '2026-08-12 18:00:00'
),
(
    'Rescate de Andromeda',
    'Andromeda-7',
    'Marcus Orion',
    'critico',
    'programada',
    '2026-08-13 09:00:00',
    '2026-08-15 20:00:00'
),
(
    'Exploración Kepler',
    'Kepler-442b',
    'Sofia Reyes',
    'medio',
    'en_curso',
    '2026-08-14 07:30:00',
    '2026-08-25 17:00:00'
),
(
    'Defensa de Solaris',
    'Solaris',
    'Victor Kane',
    'critico',
    'programada',
    '2026-08-20 10:00:00',
    '2026-08-22 22:00:00'
),
(
    'Cartografia de Titan',
    'Titan',
    'Daniel Cruz',
    'bajo',
    'programada',
    '2026-08-24 08:00:00',
    '2026-08-28 16:00:00'
),
(
    'Colonia Marte Rojo',
    'Marte',
    'Laura Mendez',
    'alto',
    'finalizada',
    '2026-07-20 09:00:00',
    '2026-07-25 18:00:00'
),
(
    'Contacto con Europa',
    'Europa',
    'Andres Torres',
    'critico',
    'en_curso',
    '2026-08-16 06:00:00',
    '2026-08-30 21:00:00'
),
(
    'Patrulla del Cinturon',
    'Cinturon de Orion',
    'Camila Soto',
    'medio',
    'programada',
    '2026-09-01 11:00:00',
    '2026-09-03 19:00:00'
);