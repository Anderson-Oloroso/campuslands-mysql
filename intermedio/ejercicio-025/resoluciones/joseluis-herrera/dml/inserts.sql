USE campuslands_mysql;

INSERT INTO formulas_quimicas
    (
        codigo_formula,
        nombre_formula,
        compuesto,
        categoria,
        cantidad_muestras,
        costo_muestra,
        estado
    )
VALUES
    ('FQ-001', 'Formula Acido Citrico', 'C6H8O7', 'Acidos', 12, 18.50, 'activa'),
    ('FQ-002', 'Formula Cloruro de Sodio', 'NaCl', 'Sales', 20, 8.75, 'activa'),
    ('FQ-003', 'Formula Acido Acetico', 'C2H4O2', 'Acidos', 15, 12.00, 'activa'),
    ('FQ-004', 'Formula Hidroxido de Sodio', 'NaOH', 'Bases', 10, 15.50, 'en_revision'),
    ('FQ-005', 'Formula Carbonato de Calcio', 'CaCO3', 'Sales', 18, 10.25, 'activa'),
    ('FQ-006', 'Formula Etanol', 'C2H6O', 'Alcoholes', 25, 9.50, 'activa'),
    ('FQ-007', 'Formula Amoniaco', 'NH3', 'Bases', 14, 11.75, 'en_revision'),
    ('FQ-008', 'Formula Acido Sulfurico', 'H2SO4', 'Acidos', 8, 22.00, 'archivada'),
    ('FQ-009', 'Formula Metanol', 'CH4O', 'Alcoholes', 16, 13.50, 'activa'),
    ('FQ-010', 'Formula Sulfato de Cobre', 'CuSO4', 'Sales', 11, 17.25, 'activa');