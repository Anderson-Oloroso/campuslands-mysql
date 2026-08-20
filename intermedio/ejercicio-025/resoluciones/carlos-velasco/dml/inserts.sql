USE campuslands_mysql;

INSERT INTO formulas_quimicas (
    codigo_formula,
    nombre_formula,
    compuesto,
    categoria,
    masa_molar,
    fecha_registro,
    estado
) VALUES
    ('FQ-001', 'Agua', 'H2O', 'Oxidos e hidruros', 18.015, '2026-08-01', 'activa'),
    ('FQ-002', 'Dioxido de carbono', 'CO2', 'Oxidos', 44.010, '2026-08-02', 'activa'),
    ('FQ-003', 'Cloruro de sodio', 'NaCl', 'Sales', 58.440, '2026-08-03', 'activa'),
    ('FQ-004', 'Acido sulfurico', 'H2SO4', 'Acidos', 98.079, '2026-08-04', 'en_revision'),
    ('FQ-005', 'Hidroxido de sodio', 'NaOH', 'Bases', 39.997, '2026-08-05', 'activa'),
    ('FQ-006', 'Amoniaco', 'NH3', 'Bases', 17.031, '2026-08-06', 'en_revision'),
    ('FQ-007', 'Carbonato de calcio', 'CaCO3', 'Sales', 100.086, '2026-08-07', 'activa'),
    ('FQ-008', 'Acido clorhidrico', 'HCl', 'Acidos', 36.461, '2026-08-08', 'inactiva'),
    ('FQ-009', 'Metano', 'CH4', 'Hidrocarburos', 16.043, '2026-08-09', 'activa'),
    ('FQ-010', 'Etanol', 'C2H5OH', 'Alcoholes', 46.069, '2026-08-10', 'en_revision');