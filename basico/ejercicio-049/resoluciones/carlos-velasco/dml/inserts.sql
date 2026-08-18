USE campuslands_mysql;

INSERT INTO saltos_paracaidismo (
    nombre_paracaidista,
    nivel_experiencia,
    fecha_salto,
    altura_salto_metros,
    duracion_caida_segundos,
    modalidad,
    estado
) VALUES
(
    'Carlos Mendoza',
    'Principiante',
    '2026-08-02',
    3000,
    45,
    'Salto tandem',
    'realizado'
),
(
    'Laura Ramirez',
    'Intermedio',
    '2026-08-04',
    3500,
    52,
    'Salto individual',
    'realizado'
),
(
    'Diego Herrera',
    'Avanzado',
    '2026-08-07',
    4200,
    65,
    'Salto individual',
    'realizado'
),
(
    'Sofia Castillo',
    'Principiante',
    '2026-08-10',
    2800,
    40,
    'Salto tandem',
    'realizado'
),
(
    'Mateo Gonzalez',
    'Intermedio',
    '2026-08-12',
    3800,
    58,
    'Salto individual',
    'programado'
),
(
    'Valentina Lopez',
    'Avanzado',
    '2026-08-14',
    4500,
    70,
    'Salto individual',
    'programado'
),
(
    'Andres Morales',
    'Intermedio',
    '2026-08-16',
    3200,
    48,
    'Salto tandem',
    'realizado'
),
(
    'Camila Torres',
    'Principiante',
    '2026-08-18',
    3000,
    44,
    'Salto tandem',
    'programado'
),
(
    'Sebastian Ortiz',
    'Avanzado',
    '2026-08-20',
    5000,
    78,
    'Salto individual',
    'programado'
),
(
    'Daniela Vargas',
    'Intermedio',
    '2026-08-22',
    3600,
    55,
    'Salto individual',
    'cancelado'
);