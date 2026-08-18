USE campuslands_mysql;

INSERT INTO formulas_quimicas (
    nombre_formula,
    formula_molecular,
    categoria,
    cantidad_muestras,
    costo_estimado,
    estado,
    fecha_registro
) VALUES
(
    'Agua',
    'H2O',
    'Compuesto inorganico',
    25,
    18.50,
    'activa',
    '2026-01-10'
),
(
    'Dioxido de carbono',
    'CO2',
    'Oxido',
    18,
    24.75,
    'activa',
    '2026-01-15'
),
(
    'Cloruro de sodio',
    'NaCl',
    'Sal',
    32,
    41.20,
    'activa',
    '2026-02-03'
),
(
    'Acido sulfurico',
    'H2SO4',
    'Acido',
    12,
    85.40,
    'activa',
    '2026-02-12'
),
(
    'Hidroxido de sodio',
    'NaOH',
    'Base',
    20,
    63.90,
    'activa',
    '2026-02-20'
),
(
    'Carbonato de calcio',
    'CaCO3',
    'Sal',
    16,
    37.80,
    'activa',
    '2026-03-05'
),
(
    'Amoniaco',
    'NH3',
    'Base',
    14,
    52.60,
    'inactiva',
    '2026-03-14'
),
(
    'Etanol',
    'C2H5OH',
    'Alcohol',
    28,
    72.30,
    'activa',
    '2026-03-22'
),
(
    'Acido acetico',
    'CH3COOH',
    'Acido',
    22,
    48.90,
    'activa',
    '2026-04-02'
),
(
    'Peroxido de hidrogeno',
    'H2O2',
    'Peroxido',
    19,
    57.45,
    'inactiva',
    '2026-04-11'
);