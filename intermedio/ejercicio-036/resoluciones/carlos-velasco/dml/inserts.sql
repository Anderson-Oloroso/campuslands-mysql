USE campuslands_mysql;

INSERT INTO autos_hiperdeportivos (
    marca,
    modelo,
    anio,
    motor,
    cilindros,
    potencia_hp,
    velocidad_max_kmh,
    precio_usd,
    transmision,
    estado
) VALUES
(
    'Bugatti',
    'Chiron Super Sport',
    2022,
    'W16 8.0L',
    16,
    1600,
    440,
    3900000.00,
    'automatica',
    'vendido'
),
(
    'Koenigsegg',
    'Jesko Absolut',
    2024,
    'V8 5.0L Twin Turbo',
    8,
    1600,
    531,
    3000000.00,
    'automatica',
    'disponible'
),
(
    'Pagani',
    'Huayra BC',
    2017,
    'V12 6.0L Twin Turbo',
    12,
    745,
    383,
    2800000.00,
    'automatica',
    'vendido'
),
(
    'McLaren',
    'Speedtail',
    2020,
    'V8 4.0L Twin Turbo',
    8,
    1070,
    403,
    2250000.00,
    'automatica',
    'reservado'
),
(
    'Rimac',
    'Nevera',
    2022,
    'Electrico',
    4,
    1914,
    412,
    2400000.00,
    'automatica',
    'disponible'
),
(
    'Aston Martin',
    'Valkyrie',
    2021,
    'V12 6.5L',
    12,
    1160,
    402,
    3000000.00,
    'automatica',
    'vendido'
),
(
    'Ferrari',
    'SF90 XX Stradale',
    2023,
    'V8 4.0L Twin Turbo',
    8,
    1030,
    320,
    850000.00,
    'automatica',
    'disponible'
),
(
    'Lamborghini',
    'Revuelto',
    2024,
    'V12 6.5L Hibrido',
    12,
    1001,
    350,
    608000.00,
    'automatica',
    'disponible'
),
(
    'Mercedes-AMG',
    'One',
    2022,
    'V6 1.6L Turbo Hibrido',
    6,
    1063,
    352,
    2750000.00,
    'automatica',
    'reservado'
),
(
    'Hennessey',
    'Venom F5',
    2024,
    'V8 6.6L Twin Turbo',
    8,
    1817,
    500,
    2100000.00,
    'manual',
    'disponible'
);