USE campuslands_mysql;

-- 1. Inserción de métodos de soldadura
INSERT INTO metodos_soldadura (nombre_metodo, descripcion_metodo) VALUES
('SMAW', 'Shielded Metal Arc Welding - Electrodo revestido'),
('GMAW', 'Gas Metal Arc Welding - Soldadura MIG/MAG'),
('GTAW', 'Gas Tungsten Arc Welding - Soldadura TIG'),
('FCAW', 'Flux-Cored Arc Welding - Alambre tubular');

-- 2. Inserción de técnicos
INSERT INTO tecnicos_soldadura (nombre_tecnico, nivel_certificacion) VALUES
('Carlos Mendoza', 'Nivel III - Inspector CWI'),
('Ana Sofía Gómez', 'Nivel II - Especialista TIG'),
('Jorge Ramírez', 'Nivel II - Estructural'),
('Lucía Torres', 'Nivel I - Operador Avanzado');

-- 3. Inserción de procesos de soldadura vinculados por Foreign Keys (mínimo 8 registros)
INSERT INTO procesos_soldadura (nombre_proyecto, metodo_id, tecnico_id, stock_material_kg, estado) VALUES
('Unión de Tuberia Acero Carbono', 1, 1, 150.50, 'activo'),
('Soldadura de Chasis Automotriz', 2, 3, 85.00, 'activo'),
('Ensamblaje Tubería Inoxidable', 3, 2, 45.20, 'activo'),
('Fabricación Estructura Pesada', 4, 1, 320.00, 'mantenimiento'),
('Reparación de Tanques de Presión', 1, 3, 95.00, 'activo'),
('Cordón de Aluminio Aeroespacial', 3, 2, 30.50, 'activo'),
('Paneles de Acero Galvanizado', 2, 4, 210.00, 'completado'),
('Montaje de Vigas de Alta Resistencia', 4, 4, 180.75, 'activo');