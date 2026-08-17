-- Datos de practica: compuestos catalogados por un laboratorio quimico.
USE campuslands_mysql;

INSERT INTO compuestos_avanzado (formula, nombre, categoria, peso_molecular, estado_fisico) VALUES
('H2SO4', 'Acido Sulfurico', 'acido', 98.079, 'liquido'),
('HCl', 'Acido Clorhidrico', 'acido', 36.458, 'liquido'),
('NaOH', 'Hidroxido de Sodio', 'base', 39.997, 'solido'),
('KOH', 'Hidroxido de Potasio', 'base', 56.106, 'solido'),
('NaCl', 'Cloruro de Sodio', 'sal', 58.443, 'solido'),
('CaCO3', 'Carbonato de Calcio', 'sal', 100.087, 'solido'),
('CO2', 'Dioxido de Carbono', 'oxido', 44.009, 'gaseoso'),
('C2H5OH', 'Etanol', 'organico', 46.068, 'liquido');
