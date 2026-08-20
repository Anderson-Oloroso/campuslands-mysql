USE campuslands_mysql;

-- Inserción de Reactivos (8 registros)
INSERT INTO reactivos (nombre_quimico, formula_molecular, numero_cas, nivel_pureza_pct, stock_gramos, nivel_riesgo) VALUES
('Ácido Acetilsalicílico', 'C9H8O4', '50-78-2', 99.50, 5000.00, 'Moderado'),
('Hidróxido de Sodio', 'NaOH', '1310-73-2', 98.00, 12000.00, 'Alto'),
('Agua Desdestilada/Desionizada', 'H2O', '7732-18-5', 99.99, 100000.00, 'Bajo'),
('Ácido Ascórbico', 'C6H8O6', '50-81-7', 99.00, 3500.00, 'Bajo'),
('Etanol Absoluto', 'C2H6O', '64-17-5', 99.80, 25000.00, 'Alto'),
('Glicerina Vegetal', 'C3H8O3', '56-81-5', 99.20, 15000.00, 'Bajo'),
('Nipagin / Metilparabeno', 'C8H8O3', '99-76-3', 98.50, 800.00, 'Moderado'),
('Peróxido de Hidrógeno 30%', 'H2O2', '7722-84-1', 30.00, 4200.00, 'Crítico');

-- Inserción de Fórmulas Químicas (8 registros)
INSERT INTO formulas_quimicas (codigo_formula, nombre_producto, aplicacion, ph_objetivo, temperatura_mezcla_c, estado) VALUES
('FORM-FAR-001', 'Solución Analgésica Oral', 'Farmacéutica', 4.20, 22.50, 'Aprobado'),
('FORM-COS-002', 'Sérum Antioxidante Vitamina C', 'Cosmética', 3.50, 20.00, 'Aprobado'),
('FORM-IND-003', 'Detergente Desengrasante Alcalino', 'Industrial', 11.50, 45.00, 'Aprobado'),
('FORM-FAR-004', 'Jarabe Inmuno Estimulante', 'Farmacéutica', 5.50, 25.00, 'En Pruebas'),
('FORM-COS-005', 'Gel Hidratante Multipropósito', 'Cosmética', 6.00, 30.00, 'Borrador'),
('FORM-ALI-006', 'Conservante Líquido Citromix', 'Alimentaria', 3.80, 18.00, 'Aprobado'),
('FORM-IND-007', 'Solución Desinfectante Concentrada', 'Industrial', 2.50, 25.00, 'En Pruebas'),
('FORM-COS-008', 'Tónico Facial Exfoliante AHA', 'Cosmética', 3.90, 22.00, 'Obsoleto');

-- Inserción de Componentes de Fórmulas (10 registros)
INSERT INTO componentes_formula (formula_id, reactivo_id, concentracion_pct, orden_adicion) VALUES
(1, 1, 15.00, 2),
(1, 3, 75.00, 1),
(1, 5, 10.00, 3),
(2, 4, 12.00, 2),
(2, 3, 80.00, 1),
(2, 6, 8.00, 3),
(3, 2, 20.00, 2),
(3, 3, 80.00, 1),
(4, 4, 8.00, 2),
(6, 4, 25.00, 1);

-- Inserción de Análisis de Reactivos (8 registros)
INSERT INTO analisis_reactivos (reactivo_id, lote_codigo, ph_medido, impurezas_ppm, resultado, fecha_analisis) VALUES
(1, 'LOT-ASA-2026-01', 3.50, 12.50, 'Conforme', '2026-01-15'),
(2, 'LOT-NAOH-2026-02', 13.20, 45.00, 'Conforme', '2026-02-10'),
(3, 'LOT-H2O-2026-01', 6.80, 1.20, 'Conforme', '2026-03-01'),
(4, 'LOT-ASC-2026-01', 2.40, 8.00, 'Conforme', '2026-03-12'),
(5, 'LOT-ETOH-2026-03', 7.10, 150.00, 'En Observación', '2026-04-05'),
(6, 'LOT-GLI-2026-01', 6.20, 5.00, 'Conforme', '2026-05-20'),
(7, 'LOT-NIP-2026-01', 5.80, 210.00, 'No Conforme', '2026-06-18'),
(8, 'LOT-H2O2-2026-02', 2.10, 30.00, 'Conforme', '2026-07-22');