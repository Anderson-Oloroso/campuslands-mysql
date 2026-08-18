USE campuslands_mysql;

INSERT INTO formulas_quimicas (
    nombre_formula,
    compuesto,
    categoria,
    cantidad_muestras,
    costo_muestra,
    estado
) VALUES
(
    'Formula del Agua',
    'H2O',
    'Inorganica',
    15,
    12.50,
    'activa'
),
(
    'Formula del Dioxido de Carbono',
    'CO2',
    'Inorganica',
    10,
    15.00,
    'activa'
),
(
    'Formula del Etanol',
    'C2H5OH',
    'Organica',
    8,
    22.50,
    'en_revision'
),
(
    'Formula del Acido Acetico',
    'CH3COOH',
    'Organica',
    12,
    18.75,
    'activa'
),
(
    'Formula del Cloruro de Sodio',
    'NaCl',
    'Inorganica',
    20,
    10.00,
    'activa'
),
(
    'Formula de la Glucosa',
    'C6H12O6',
    'Organica',
    14,
    25.00,
    'en_revision'
),
(
    'Formula del Amoniaco',
    'NH3',
    'Inorganica',
    9,
    16.50,
    'archivada'
),
(
    'Formula del Acido Sulfurico',
    'H2SO4',
    'Acidos',
    11,
    30.00,
    'activa'
),
(
    'Formula del Hidroxido de Sodio',
    'NaOH',
    'Bases',
    16,
    14.50,
    'activa'
),
(
    'Formula del Metano',
    'CH4',
    'Organica',
    7,
    20.00,
    'archivada'
);