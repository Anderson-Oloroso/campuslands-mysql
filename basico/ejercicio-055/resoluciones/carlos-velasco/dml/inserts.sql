USE campuslands_mysql;

INSERT INTO formulas_quimicas (
    nombre,
    formula,
    categoria,
    cantidad_muestras,
    costo_muestra,
    estado
) VALUES
    ('Agua', 'H2O', 'Oxido', 12, 15.50, 'activa'),
    ('Dioxido de carbono', 'CO2', 'Oxido', 8, 22.00, 'activa'),
    ('Cloruro de sodio', 'NaCl', 'Sal', 15, 10.50, 'activa'),
    ('Acido sulfurico', 'H2SO4', 'Acido', 6, 35.00, 'activa'),
    ('Acido clorhidrico', 'HCl', 'Acido', 10, 28.50, 'activa'),
    ('Hidroxido de sodio', 'NaOH', 'Base', 9, 19.00, 'activa'),
    ('Carbonato de calcio', 'CaCO3', 'Sal', 7, 17.50, 'activa'),
    ('Amoniaco', 'NH3', 'Base', 5, 24.00, 'inactiva');