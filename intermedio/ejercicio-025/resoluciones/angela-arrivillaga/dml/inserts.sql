use laboratorio_quimico_db;

insert into categorias_reactivos (nombre_categoria, nivel_peligrosidad) values
('acidos fuertes', 'alto'),
('solventes organicos', 'moderado'),
('sales inorganicas', 'bajo'),
('compuestos toxicos', 'critico');

insert into investigadores (codigo_empleado, nombre_investigador, correo_institucional) values
('INV-001', 'carlos arturo gomez', 'carlos.gomez@labquimica.org'),
('INV-002', 'valeria mendoza', 'valeria.mendoza@labquimica.org'),
('INV-003', 'sofia de la cruz', 'sofia.cruz@labquimica.org'),
('INV-004', 'mateo silva', 'mateo.silva@labquimica.org');

insert into formulas_quimicas (codigo_formula, nombre_formula, formula_molecular, id_categoria, id_investigador, rendimiento_porcentaje, estado_formula) values
('FOR-001', 'acido sulfonico sintetico', 'hso3r', 1, 1, 92.50, 'patentada'),
('FOR-002', 'etilenglicol purificado', 'c2h6o2', 2, 2, 88.00, 'verificada'),
('FOR-003', 'sulfato de cobre pentahidratado', 'cuso4.5h2o', 3, 3, 95.40, 'patentada'),
('FOR-004', 'cianuro de hidrogeno estabilizado', 'hcn', 4, 4, 45.20, 'rechazada'),
('FOR-005', 'acido clorhidrico diluido', 'hcl', 1, 2, 78.50, 'en_prueba'),
('FOR-006', 'dimetil sulfoxido anhidro', 'c2h6os', 2, 1, 85.10, 'verificada'),
('FOR-007', 'nitrato de amonio cristalino', 'nh4no3', 3, 4, 90.00, 'en_prueba'),
('FOR-008', 'cloroformo estabilizado', 'chcl3', 4, 3, 62.30, 'rechazada');