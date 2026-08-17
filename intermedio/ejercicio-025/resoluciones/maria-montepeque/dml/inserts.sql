-- Datos de practica: formulas quimicas y sus lotes de produccion.
-- El numero de lote 'L-001' se repite a proposito en varias formulas
-- distintas (permitido), pero nunca dos veces para la MISMA formula.
USE campuslands_mysql;

INSERT INTO formulas_quimicas_intermedio (codigo_formula, nombre_compuesto, categoria, estado_fisico) VALUES
('H2SO4', 'Acido Sulfurico', 'acido', 'liquido'),
('NaOH', 'Hidroxido de Sodio', 'base', 'solido'),
('NaCl', 'Cloruro de Sodio', 'sal', 'solido'),
('CO2', 'Dioxido de Carbono', 'oxido', 'gaseoso'),
('C2H5OH', 'Etanol', 'organico', 'liquido');

INSERT INTO lotes_formula_intermedio (id_formula, numero_lote, cantidad_producida, fecha_produccion) VALUES
(1, 'L-001', 50.00, '2026-01-05'),
(1, 'L-002', 45.00, '2026-01-20'),
(2, 'L-001', 30.00, '2026-01-10'),
(2, 'L-002', 35.00, '2026-02-01'),
(3, 'L-001', 60.00, '2026-01-15'),
(3, 'L-002', 55.00, '2026-02-10'),
(4, 'L-001', 20.00, '2026-01-25'),
(5, 'L-001', 40.00, '2026-02-05'),
(5, 'L-002', 42.00, '2026-02-20');
