USE campuslands_mysql;

INSERT INTO formulas_quimicas (
    nombre,
    formula,
    categoria,
    cantidad_muestras,
    estado
) VALUES
    ('Agua', 'H2O', 'Compuesto', 12, 'activa'),
    ('Dioxido de carbono', 'CO2', 'Oxido', 8, 'activa'),
    ('Cloruro de sodio', 'NaCl', 'Sal', 15, 'activa'),
    ('Acido sulfurico', 'H2SO4', 'Acido', 6, 'activa'),
    ('Acido clorhidrico', 'HCl', 'Acido', 10, 'activa'),
    ('Hidroxido de sodio', 'NaOH', 'Base', 9, 'activa'),
    ('Carbonato de calcio', 'CaCO3', 'Sal', 7, 'activa'),
    ('Amoniaco', 'NH3', 'Base', 5, 'inactiva');