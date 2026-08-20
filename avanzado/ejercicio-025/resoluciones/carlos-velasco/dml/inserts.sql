-- ============================================================
-- Ejercicio 025 - Datos del laboratorio
-- ============================================================

USE campuslands_mysql;


-- ------------------------------------------------------------
-- Responsables
-- ------------------------------------------------------------
INSERT INTO responsables (
    nombre,
    especialidad,
    estado
)
VALUES
    ('Laura Martinez', 'quimica analitica', 'activo'),
    ('Carlos Herrera', 'quimica organica', 'activo'),
    ('Sofia Rodriguez', 'bioquimica', 'activo'),
    ('Daniel Morales', 'quimica industrial', 'activo'),
    ('Valentina Gomez', 'quimica analitica', 'activo'),
    ('Andres Castillo', 'quimica organica', 'activo'),
    ('Camila Perez', 'control de calidad', 'activo'),
    ('Miguel Torres', 'quimica industrial', 'inactivo');


-- ------------------------------------------------------------
-- Sustancias
-- ------------------------------------------------------------
INSERT INTO sustancias (
    nombre,
    formula_quimica,
    categoria,
    estado
)
VALUES
    ('Agua', 'H2O', 'solvente', 'disponible'),
    ('Cloruro de sodio', 'NaCl', 'sal', 'disponible'),
    ('Acido clorhidrico', 'HCl', 'acido', 'restringida'),
    ('Hidroxido de sodio', 'NaOH', 'base', 'restringida'),
    ('Etanol', 'C2H5OH', 'alcohol', 'disponible'),
    ('Acido acetico', 'CH3COOH', 'acido', 'disponible'),
    ('Carbonato de sodio', 'Na2CO3', 'sal', 'disponible'),
    ('Bicarbonato de sodio', 'NaHCO3', 'sal', 'disponible'),
    ('Peroxido de hidrogeno', 'H2O2', 'oxidante', 'restringida'),
    ('Sulfato de cobre', 'CuSO4', 'sal', 'disponible');


-- ------------------------------------------------------------
-- Fórmulas del laboratorio
-- ------------------------------------------------------------
INSERT INTO formulas_laboratorio (
    id_responsable,
    nombre,
    objetivo,
    fecha_creacion,
    nivel_riesgo,
    cantidad_componentes,
    estado
)
VALUES
    (1, 'Solucion salina', 'Preparacion de solucion salina de laboratorio', '2026-01-10', 'bajo', 2, 'validada'),
    (2, 'Solucion acida controlada', 'Preparacion de medio acido para pruebas', '2026-01-18', 'alto', 2, 'validada'),
    (3, 'Solucion basica', 'Preparacion de medio basico para analisis', '2026-02-05', 'alto', 2, 'validada'),
    (4, 'Solucion hidroalcoholica', 'Preparacion de mezcla hidroalcoholica', '2026-02-20', 'medio', 2, 'validada'),
    (5, 'Buffer de acetato', 'Preparacion de solucion reguladora', '2026-03-03', 'medio', 3, 'borrador'),
    (6, 'Mezcla carbonatada', 'Evaluacion de reaccion entre sales', '2026-03-15', 'bajo', 3, 'validada'),
    (7, 'Solucion oxidante', 'Preparacion controlada para pruebas de oxidacion', '2026-04-01', 'alto', 2, 'borrador'),
    (1, 'Solucion de sulfato', 'Preparacion de solucion para analisis de cobre', '2026-04-12', 'medio', 2, 'validada'),
    (4, 'Solucion de limpieza', 'Preparacion de solucion para limpieza tecnica', '2026-05-02', 'medio', 3, 'borrador'),
    (3, 'Mezcla de laboratorio general', 'Preparacion de mezcla para practicas generales', '2026-05-20', 'bajo', 3, 'archivada');


-- ------------------------------------------------------------
-- Componentes de las fórmulas
-- ------------------------------------------------------------
INSERT INTO formula_sustancias (
    id_formula,
    id_sustancia,
    cantidad,
    unidad
)
VALUES
    (1, 1, 950.00, 'ml'),
    (1, 2, 50.00, 'g'),

    (2, 1, 900.00, 'ml'),
    (2, 3, 100.00, 'ml'),

    (3, 1, 900.00, 'ml'),
    (3, 4, 100.00, 'g'),

    (4, 1, 700.00, 'ml'),
    (4, 5, 300.00, 'ml'),

    (5, 1, 800.00, 'ml'),
    (5, 6, 100.00, 'ml'),
    (5, 7, 100.00, 'g'),

    (6, 1, 800.00, 'ml'),
    (6, 7, 100.00, 'g'),
    (6, 8, 100.00, 'g'),

    (7, 1, 900.00, 'ml'),
    (7, 9, 100.00, 'ml'),

    (8, 1, 900.00, 'ml'),
    (8, 10, 100.00, 'g'),

    (9, 1, 700.00, 'ml'),
    (9, 4, 100.00, 'g'),
    (9, 5, 200.00, 'ml'),

    (10, 1, 800.00, 'ml'),
    (10, 2, 100.00, 'g'),
    (10, 8, 100.00, 'g');