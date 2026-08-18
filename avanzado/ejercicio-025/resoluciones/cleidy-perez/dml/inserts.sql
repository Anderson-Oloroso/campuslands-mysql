-- Datos de practica. Puedes cambiarlos o agregar mas filas.
-- Insertar Reactivos (6 registros)
INSERT INTO reactivos (cas_number, nombre_quimico, formula_molecular, nivel_riesgo) VALUES
('7647-01-0', 'Ácido Clorhídrico', 'HCl', 'Alto'),
('1310-73-2', 'Hidróxido de Sodio', 'NaOH', 'Alto'),
('7732-18-5', 'Agua Desdestilada', 'H2O', 'Bajo'),
('64-17-5', 'Etanol Absoluto', 'C2H6O', 'Medio'),
('7664-93-9', 'Ácido Sulfúrico', 'H2SO4', 'Critico'),
('50-00-0', 'Formaldehído', 'CH2O', 'Critico');

-- Insertar Investigadores (6 registros)
INSERT INTO investigadores (codigo_credencial, nombre, email) VALUES
('INV-001', 'Dr. Carlos Mendoza', 'carlos.mendoza@labquimico.com'),
('INV-002', 'Dra. Elena Torres', 'elena.torres@labquimico.com'),
('INV-003', 'Lic. Sofía Martínez', 'sofia.martinez@labquimico.com'),
('INV-004', 'Ing. Roberto Gómez', 'roberto.gomez@labquimico.com'),
('INV-005', 'Msc. Mario Páez', 'mario.paez@labquimico.com'),
('INV-006', 'Dra. Lucía Méndez', 'lucia.mendez@labquimico.com');

-- Insertar Fórmulas Químicas (6 registros)
INSERT INTO formulas (codigo_formula, nombre_comercial, id_investigador) VALUES
('FORM-001', 'Solución Limpiadora Industrial', 1),
('FORM-002', 'Gel Antiséptico pH Neutro', 2),
('FORM-003', 'Reactivo Acelerante de Síntesis', 3),
('FORM-004', 'Inhibidor de Corrosión Marina', 4),
('FORM-005', 'Buffer de Calibración pH 4.0', 5),
('FORM-006', 'Solución Titulante Estándar', 6);

-- Insertar Ejercicios (6 registros con el Ejercicio 025)
INSERT INTO ejercicios (codigo, titulo, dificultad, tematica, id_formula) VALUES
('EJ-021', 'Balanceo de Ecuaciones Químicas', 'Intermedio', 'laboratorio de formulas quimicas', 1),
('EJ-022', 'Determinación de Molaridad y Normalidad', 'Intermedio aplicado', 'laboratorio de formulas quimicas', 2),
('EJ-023', 'Cálculo de Estequiometría de Reacción', 'Avanzado', 'laboratorio de formulas quimicas', 3),
('EJ-024', 'Preparación de Soluciones Buffer', 'Avanzado aplicado', 'laboratorio de formulas quimicas', 4),
('EJ-025', 'UNIQUE para laboratorio de formulas quimicas', 'Intermedio aplicado', 'laboratorio de formulas quimicas', 5),
('EJ-026', 'Análisis de Volatilidad de Compuestos', 'Avanzado', 'laboratorio de formulas quimicas', 6);

-- Insertar Composición de Fórmulas (6 registros probando la restricción UNIQUE compuesta)
INSERT INTO composicion_formulas (id_formula, id_reactivo, concentracion_porcentaje) VALUES
(5, 3, 85.00), -- Fórmula 5 usa Agua Desdestilada
(5, 1, 15.00), -- Fórmula 5 usa Ácido Clorhídrico
(2, 4, 70.00), -- Fórmula 2 usa Etanol Absoluto
(2, 3, 30.00), -- Fórmula 2 usa Agua Desdestilada
(1, 2, 25.00), -- Fórmula 1 usa Hidróxido de Sodio
(4, 5, 10.00); -- Fórmula 4 usa Ácido Sulfúrico
