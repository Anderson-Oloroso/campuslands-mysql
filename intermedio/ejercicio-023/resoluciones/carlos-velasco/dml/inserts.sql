USE campuslands_mysql;

INSERT INTO arquitectos (
    nombre,
    experiencia_anios
) VALUES
('Carlos Mendoza', 5),
('Laura Castillo', 7),
('Andres Ramirez', 4),
('Sofia Torres', 6),
('Diego Herrera', 8),
('Valentina Cruz', 3);

INSERT INTO tipos_proyecto (
    nombre_tipo
) VALUES
('Residencial'),
('Comercial'),
('Institucional'),
('Deportivo'),
('Hotelero');

INSERT INTO softwares_3d (
    nombre_software
) VALUES
('SketchUp'),
('Revit'),
('3ds Max'),
('Blender');

INSERT INTO estados_proyecto (
    nombre_estado
) VALUES
('Planificado'),
('En proceso'),
('Finalizado'),
('Cancelado');

INSERT INTO proyectos_arquitectura_3d (
    nombre_proyecto,
    id_arquitecto,
    id_tipo,
    id_software,
    id_estado,
    presupuesto
) VALUES
('Casa Moderna', 1, 1, 1, 1, 8500.00),
('Edificio Central', 2, 2, 2, 2, 18500.00),
('Villa Panoramica', 3, 1, 3, 2, 12000.00),
('Centro Cultural', 4, 3, 2, 1, 25000.00),
('Restaurante Urbano', 5, 2, 1, 3, 9500.00),
('Complejo Deportivo', 6, 4, 4, 1, 32000.00),
('Oficinas Verdes', 1, 2, 2, 2, 21000.00),
('Casa Minimalista', 3, 1, 1, 1, 7800.00),
('Hotel Vista Norte', 2, 5, 3, 2, 28000.00),
('Biblioteca Municipal', 4, 3, 4, 3, 19500.00);