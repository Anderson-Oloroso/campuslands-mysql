USE campuslands_mysql;

INSERT INTO formulas_quimicas
    (nombre_formula, compuesto, categoria, cantidad_muestras, costo_muestra, estado)
VALUES
    ('Formula Acido Citrico', 'C6H8O7', 'Acidos', 12, 18.50, 'activa'),
    ('Formula Cloruro de Sodio', 'NaCl', 'Sales', 20, 8.75, 'activa'),
    ('Formula Acido Acetico', 'C2H4O2', 'Acidos', 15, 12.00, 'activa'),
    ('Formula Hidroxido de Sodio', 'NaOH', 'Bases', 10, 15.50, 'en_revision'),
    ('Formula Carbonato de Calcio', 'CaCO3', 'Sales', 18, 10.25, 'activa'),
    ('Formula Etanol', 'C2H6O', 'Alcoholes', 25, 9.50, 'activa'),
    ('Formula Amoniaco', 'NH3', 'Bases', 14, 11.75, 'en_revision'),
    ('Formula Acido Sulfurico', 'H2SO4', 'Acidos', 8, 22.00, 'archivada'),
    ('Formula Metanol', 'CH4O', 'Alcoholes', 16, 13.50, 'activa'),
    ('Formula Sulfato de Cobre', 'CuSO4', 'Sales', 11, 17.25, 'activa');