-- Insercion de datos para arquitectura 3D (ejercicio-023)
USE campuslands_mysql;

-- Insercion en firmas_arquitectura
INSERT INTO firmas_arquitectura (nombre_firma, pais, arquitecto_lider) VALUES
('Zaha Hadid Architects', 'Reino Unido', 'Patrik Schumacher'),
('Foster + Partners', 'Reino Unido', 'Norman Foster'),
('Bjarke Ingels Group (BIG)', 'Dinamarca', 'Bjarke Ingels'),
('Snøhetta Design', 'Noruega', 'Kjetil Thorsen'),
('Herzog & de Meuron', 'Suiza', 'Jacques Herzog');

-- Insercion en proyectos_bim
INSERT INTO proyectos_bim (nombre_obra, id_firma, tipologia, area_m2, presupuesto_millones, software_bim, estado_proyecto) VALUES
('Daxing International Airport', 1, 'Comercial', 700000.00, 1200.00, 'Rhino Grasshopper', 'Finalizado'),
('One Thousand Museum Tower', 1, 'Residencial Lujo', 85000.00, 280.00, 'Rhino Grasshopper', 'Finalizado'),
('Apple Park Headquarters', 2, 'Rascacielos Corporativo', 260000.00, 5000.00, 'Revit BIM', 'Finalizado'),
('The Gherkin 30 St Mary Axe', 2, 'Rascacielos Corporativo', 47950.00, 138.00, 'Revit BIM', 'Finalizado'),
('CopenHill Waste-to-Energy', 3, 'Museo/Cultural', 41000.00, 660.00, 'Archicad', 'Finalizado'),
('The Spiral Hudson Yards', 3, 'Rascacielos Corporativo', 265000.00, 1800.00, 'Revit BIM', 'Finalizado'),
('Oslo Opera House', 4, 'Museo/Cultural', 38500.00, 500.00, 'Archicad', 'Finalizado'),
('Under Underwater Restaurant', 4, 'Comercial', 600.00, 8.50, 'Archicad', 'Finalizado'),
('Elbphilharmonie Hamburg', 5, 'Museo/Cultural', 120000.00, 866.00, 'Revit BIM', 'Finalizado'),
('Tate Modern Extension', 5, 'Museo/Cultural', 21500.00, 260.00, 'Revit BIM', 'Finalizado'),
('King Abdullah Financial District Metro', 1, 'Comercial', 45000.00, 450.00, 'Rhino Grasshopper', 'En Construccion'),
('Marina Bay Sands Towers', 2, 'Comercial', 581400.00, 5800.00, 'Revit BIM', 'Finalizado');

