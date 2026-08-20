USE campuslands_mysql;

-- Inserción de Químicos Analistas
INSERT INTO quimicos_analistas (nombre, apellido, email, codigo_colegiado, nivel_acceso) VALUES
('Elena', 'Vásquez', 'elena.vasquez@labchem.com', 'COL-Q-1049', 'Senior'),
('Roberto', 'Mendoza', 'roberto.mendoza@labchem.com', 'COL-Q-2051', 'Senior'),
('Carmen', 'Soto', 'carmen.soto@labchem.com', 'COL-Q-3088', 'Director Laboratorio'),
('Daniel', 'Navarro', 'daniel.navarro@labchem.com', 'COL-Q-4102', 'Junior');

-- Inserción de Reactivos Base (Claves UNIQUE: codigo_reactivo, numero_cas)
INSERT INTO reactivos (codigo_reactivo, numero_cas, nombre_quimico, pureza_porcentaje, stock_gramos, requiere_refrigeracion) VALUES
('REACT-001', '7647-01-0', 'Ácido Clorhídrico (HCl)', 37.00, 5000.00, FALSE),
('REACT-002', '1310-73-2', 'Hidróxido de Sodio (NaOH)', 98.50, 8500.00, FALSE),
('REACT-003', '7732-18-5', 'Agua Desionizada (H2O)', 99.99, 50000.00, FALSE),
('REACT-004', '64-17-5', 'Etanol Anhidro (C2H5OH)', 99.50, 12000.00, TRUE),
('REACT-005', '7664-93-9', 'Ácido Sulfúrico (H2SO4)', 96.00, 4200.00, FALSE),
('REACT-006', '50-81-7', 'Ácido Ascórbico (C6H8O6)', 99.00, 1500.00, TRUE);

-- Inserción de Fórmulas Químicas (Claves UNIQUE: codigo_formula, nombre_formula)
INSERT INTO formulas_quimicas (codigo_formula, nombre_formula, formula_molecular, quimico_id, ph_objetivo, temperatura_reaccion_c, fecha_creacion, estado) VALUES
('FORM-2026-A1', 'Solución Buffer Fosfato Estándar', 'H3PO4 + NaOH', 1, 7.40, 25.00, '2026-01-15', 'Aprobada'),
('FORM-2026-A2', 'Reactivo Analítico Volumétrico A', 'HCl + H2O', 2, 1.20, 20.00, '2026-02-01', 'En Certificación'),
('FORM-2026-B1', 'Solución Sanitizante Hidroalcohólica', 'C2H5OH + H2O', 1, 6.50, 18.00, '2026-02-20', 'Aprobada'),
('FORM-2026-C1', 'Disolución Electrolítica Concentrada', 'H2SO4 + H2O', 3, 0.80, 45.00, '2026-03-10', 'En Desarrollo'),
('FORM-2026-D1', 'Sérum Antioxidante Estabilizado', 'C6H8O6 + H2O + C2H5OH', 4, 3.50, 15.00, '2026-04-05', 'En Desarrollo');

-- Inserción de Detalle de Fórmulas (Restricciones UNIQUE Compuestas)
INSERT INTO detalle_formulas (formula_id, reactivo_id, concentración_proporción, unidad_medida, orden_adicion) VALUES
(1, 3, 850.000, 'mL/L', 1),
(1, 2, 150.000, 'g/L', 2),
(2, 3, 900.000, 'mL/L', 1),
(2, 1, 100.000, 'mL/L', 2),
(3, 3, 300.000, 'mL/L', 1),
(3, 4, 700.000, 'mL/L', 2),
(4, 3, 800.000, 'mL/L', 1),
(4, 5, 200.000, 'mL/L', 2),
(5, 3, 600.000, 'mL/L', 1),
(5, 6, 150.000, 'g/L', 2),
(5, 4, 250.000, 'mL/L', 3);