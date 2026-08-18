USE campuslands_mysql;

INSERT INTO formulas_quimicas (
    nombre_formula,
    compuesto_principal,
    categoria,
    cantidad_muestras,
    cantidad_reactivo,
    estado,
    fecha_registro
) VALUES
('Formula Acida A', 'Acido sulfurico', 'Acidos', 12, 250.50, 'activa', '2026-01-10'),
('Formula Basica B', 'Hidroxido de sodio', 'Bases', 8, 180.00, 'activa', '2026-01-15'),
('Formula Salina C', 'Cloruro de sodio', 'Sales', 15, 320.75, 'activa', '2026-01-22'),
('Formula Organica D', 'Etanol', 'Organicos', 10, 210.00, 'activa', '2026-02-05'),
('Formula Acida E', 'Acido clorhidrico', 'Acidos', 6, 145.50, 'inactiva', '2026-02-12'),
('Formula Basica F', 'Hidroxido de potasio', 'Bases', 14, 290.25, 'activa', '2026-02-20'),
('Formula Salina G', 'Carbonato de calcio', 'Sales', 9, 195.80, 'activa', '2026-03-03'),
('Formula Organica H', 'Acetona', 'Organicos', 11, 235.40, 'activa', '2026-03-18'),
('Formula Acida I', 'Acido nitrico', 'Acidos', 7, 160.00, 'activa', '2026-04-02'),
('Formula Basica J', 'Amoniaco', 'Bases', 13, 275.60, 'inactiva', '2026-04-15');