USE campuslands_mysql;

INSERT INTO formulas_quimicas
    (nombre, formula_quimica, categoria, masa_molar, estado, fecha_registro)
VALUES
    ('Agua', 'H2O', 'Oxido', 18.015, 'activo', '2026-01-10'),
    ('Dioxido de carbono', 'CO2', 'Oxido', 44.010, 'activo', '2026-01-12'),
    ('Cloruro de sodio', 'NaCl', 'Sal', 58.440, 'activo', '2026-01-15'),
    ('Acido clorhidrico', 'HCl', 'Acido', 36.460, 'activo', '2026-01-20'),
    ('Hidroxido de sodio', 'NaOH', 'Base', 40.000, 'activo', '2026-02-02'),
    ('Acido sulfurico', 'H2SO4', 'Acido', 98.079, 'activo', '2026-02-08'),
    ('Amoniaco', 'NH3', 'Base', 17.031, 'activo', '2026-02-14'),
    ('Carbonato de calcio', 'CaCO3', 'Sal', 100.086, 'activo', '2026-02-18'),
    ('Glucosa', 'C6H12O6', 'Organica', 180.156, 'activo', '2026-03-01'),
    ('Etanol', 'C2H5OH', 'Organica', 46.069, 'inactivo', '2026-03-05');