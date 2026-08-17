-- Datos de practica: compuestos quimicos y sus lotes de produccion.
-- El numero de lote 'L-001' se repite a proposito en varios compuestos
-- distintos (permitido), pero nunca dos veces para el MISMO compuesto.
USE campuslands_mysql;

INSERT INTO compuestos_lab_intermedio (codigo_compuesto, nombre_compuesto, categoria, estado_fisico) VALUES
('H2SO4', 'Acido Sulfurico', 'acido', 'liquido'),
('NaOH', 'Hidroxido de Sodio', 'base', 'solido'),
('NaCl', 'Cloruro de Sodio', 'sal', 'solido'),
('CO2', 'Dioxido de Carbono', 'oxido', 'gaseoso'),
('C2H5OH', 'Etanol', 'organico', 'liquido');

INSERT INTO lotes_produccion_intermedio (id_compuesto, numero_lote, cantidad_producida, fecha_produccion) VALUES
(1, 'L-001', 52.00, '2026-01-05'),
(1, 'L-002', 47.00, '2026-01-20'),
(2, 'L-001', 32.00, '2026-01-10'),
(2, 'L-002', 36.00, '2026-02-01'),
(3, 'L-001', 62.00, '2026-01-15'),
(3, 'L-002', 57.00, '2026-02-10'),
(4, 'L-001', 22.00, '2026-01-25'),
(5, 'L-001', 42.00, '2026-02-05'),
(5, 'L-002', 44.00, '2026-02-20');
