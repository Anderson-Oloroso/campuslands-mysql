use arquitectura_3d_roles_db;

insert into arquitectos (nombre_completo, especialidad, correo, nivel_seniority) values
('Angela Arrivillaga', 'Modelado BIM & Coordinación', 'angela.arrivillaga@campus.arch.com', 'senior'),
('Jinx Chaosmaker', 'Renderizado ArchViz & FX', 'jinx.chaos@campus.arch.com', 'principal'),
('Cyber Valka', 'Diseño Paramétrico', 'valka.cyber@campus.arch.com', 'semi-senior'),
('Ghibli Dreamer', 'Paisajismo Sostenible', 'ghibli.dream@campus.arch.com', 'senior'),
('Neon Brush', 'Visualización Arquitectónica', 'neon.brush@campus.arch.com', 'junior'),
('Hollow Knight Fan', 'Estructuras Complejas', 'hollow.knight@campus.arch.com', 'semi-senior');

insert into software_cad (nombre_software, desarrollador, categoria) values
('Autodesk Revit', 'Autodesk', 'bim'),
('Rhino 3D + Grasshopper', 'McNeel', 'cad_3d'),
('Lumion Pro', 'Act-3D B.V.', 'renderizador'),
('Twinmotion', 'Epic Games', 'renderizador'),
('Archicad', 'Graphisoft', 'bim');

insert into proyectos_arquitectura (id_arquitecto, id_software, nombre_proyecto, superficie_m2, presupuesto_usd, estado_proyecto, fecha_inicio) values
(1, 1, 'Torre Corporativa Cyberpunk Central', 12500.00, 4500000.00, 'en_desarrollo', '2026-01-10'),
(2, 3, 'Villa Coquette Minimalista', 450.50, 680000.00, 'render_final', '2026-02-15'),
(3, 2, 'Pabellón Paramétrico Zaun', 1200.00, 1250000.00, 'anteproyecto', '2026-03-01'),
(4, 5, 'Centro Botánico Ghibli Forest', 3800.00, 2100000.00, 'entregado', '2026-01-20'),
(5, 4, 'Urban Park & Skateboard Plaza', 8500.00, 950000.00, 'en_desarrollo', '2026-04-10'),
(1, 2, 'Museo de Arte Abisal Hollow', 6200.00, 3100000.00, 'anteproyecto', '2026-05-02'),
(6, 1, 'Complejo Residencial Valkyrie', 9400.00, 2800000.00, 'render_final', '2026-03-20'),
(2, 4, 'Skyscraper Neon Skyline Tower', 22000.00, 8900000.00, 'en_desarrollo', '2026-06-01'),
(3, 3, 'Eco-Dome Research Center', 2100.00, 1450000.00, 'entregado', '2026-02-10'),
(4, 1, 'Biblioteca Central Campus 3D', 5400.00, 1950000.00, 'render_final', '2026-04-15');

insert into componentes_3d (nombre_componente, tipo_elemento, peso_archivo_mb) values
('Muro Cortina Paramétrico Acristalado', 'estructura', 45.50),
('Sillón Ergonómico Minimalista Coquette', 'mobiliario', 12.20),
('Árbol Sakura 3D Realista Poly', 'iluminacion', 85.00),
('Luminaria LED Lineal Empotrada', 'iluminacion', 3.40),
('Textura PBR Concreto Pulido Brutalista', 'material_pbr', 28.00),
('Escalera Helicoidal Metálica', 'estructura', 64.80),
('Sistema Fotovoltaico En Cubierta', 'estructura', 18.90);

insert into proyectos_componentes (id_proyecto, id_componente, cantidad) values
(1, 1, 150), (1, 4, 300), (1, 5, 50),
(2, 2, 24), (2, 4, 45), (2, 5, 12),
(3, 1, 80), (3, 6, 2),
(4, 3, 120), (4, 4, 80),
(5, 3, 200), (5, 4, 150),
(6, 6, 4), (6, 1, 90),
(7, 1, 110), (7, 2, 60), (7, 5, 25),
(8, 1, 400), (8, 7, 80),
(9, 3, 50), (9, 7, 20),
(10, 2, 40), (10, 4, 120), (10, 5, 30);