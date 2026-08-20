USE campuslands_mysql;

INSERT INTO viajes (
    destino,
    pais,
    fecha_salida,
    duracion_dias,
    precio_base,
    descuento_porcentaje,
    estado
) VALUES
(
    'Antigua Guatemala',
    'Guatemala',
    '2026-09-05',
    3,
    450.00,
    10.00,
    'disponible'
),
(
    'Cancun',
    'Mexico',
    '2026-09-12',
    5,
    850.00,
    15.00,
    'reservado'
),
(
    'Cartagena',
    'Colombia',
    '2026-09-20',
    4,
    720.00,
    10.00,
    'disponible'
),
(
    'San Jose',
    'Costa Rica',
    '2026-10-03',
    4,
    680.00,
    5.00,
    'disponible'
),
(
    'Madrid',
    'España',
    '2026-10-15',
    10,
    1850.00,
    12.00,
    'reservado'
),
(
    'Paris',
    'Francia',
    '2026-11-02',
    8,
    2200.00,
    8.00,
    'disponible'
),
(
    'Buenos Aires',
    'Argentina',
    '2026-11-10',
    7,
    1400.00,
    10.00,
    'finalizado'
),
(
    'Lima',
    'Peru',
    '2026-11-18',
    5,
    760.00,
    5.00,
    'disponible'
),
(
    'Nueva York',
    'Estados Unidos',
    '2026-12-04',
    7,
    1950.00,
    15.00,
    'reservado'
),
(
    'Punta Cana',
    'Republica Dominicana',
    '2026-12-15',
    6,
    1250.00,
    20.00,
    'disponible'
);