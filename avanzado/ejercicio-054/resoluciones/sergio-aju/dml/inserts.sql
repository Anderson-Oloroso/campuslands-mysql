USE campuslands_mysql;

-- Inserción de Arquitectos / Diseñadores 3D (4 registros)
INSERT INTO arquitectos (nombre, email, especialidad, nivel, costo_hora, estado) VALUES
('Arq. Mateo Silva', 'mateo.silva@arch3d.com', 'BIM', 'Senior', 55.00, 'Activo'),
('Arq. Valeria Gómez', 'valeria.gomez@arch3d.com', 'Renders Fotorrealistas', 'Lead', 70.00, 'Activo'),
('Ing. Lucas Torrez', 'lucas.torrez@arch3d.com', 'Exteriorismo', 'Mid', 40.00, 'Activo'),
('Arq. Camila Ríos', 'camila.rios@arch3d.com', 'Interiorismo', 'Junior', 28.00, 'Inactivo');

-- Inserción de Proyectos de Arquitectura (8 registros)
INSERT INTO proyectos_arquitectura (arquitecto_id, nombre_proyecto, cliente, tipo_propiedad, presupuesto_usd, estado) VALUES
(1, 'Torre Mirador Loft', 'Inmobiliaria Skyline', 'Corporativo', 250000.00, 'Modelado 3D'),
(2, 'Residencia Campestre Valle', 'Familia Mendoza', 'Residencial', 85000.00, 'Renderizado'),
(2, 'Centro Comercial Plaza Nova', 'Grupo Capital', 'Comercial', 420000.00, 'Modelado 3D'),
(3, 'Masterplan Parque Urbano', 'Alcaldía Central', 'Urbanístico', 180000.00, 'Diseño'),
(1, 'Oficinas Tech Hub', 'Innovate Corp', 'Corporativo', 120000.00, 'Entregado'),
(2, 'Penthouse Deluxe', 'Privado', 'Residencial', 95000.00, 'Entregado'),
(3, 'Restaurante Gourmet Bistro', 'Gourmet Group', 'Comercial', 65000.00, 'Renderizado'),
(1, 'Ecovillas Sustentables', 'Eco Green S.A.', 'Residencial', 310000.00, 'Diseño');

-- Inserción de Escenas 3D y Renders (10 registros)
INSERT INTO render_escenas (proyecto_id, nombre_escena, resolucion, poligonos_totales, tiempo_render_minutos, calidad_score, estado) VALUES
(1, 'Lobby Principal Día', '8K', 8500000, 145.50, 9.5, 'Aprobado'),
(1, 'Fachada Cristal Noche', '4K', 6200000, 90.00, 8.8, 'Aprobado'),
(2, 'Terraza y Piscina Sunset', '4K', 3400000, 55.20, 9.2, 'Aprobado'),
(2, 'Sala de Estar Doble Altura', '4K', 2900000, 42.00, 7.5, 'Aprobado'),
(3, 'Vista Aérea General', '8K', 15000000, 310.00, 9.8, 'Aprobado'),
(3, 'Plaza Comercial Interior', '4K', 9100000, 180.00, 8.0, 'Procesando'),
(4, 'Recorrido Peatonal Central', 'FHD', 1800000, 25.00, 6.5, 'Rechazado'),
(5, 'Open Space Workstation', '4K', 4100000, 60.00, 9.0, 'Aprobado'),
(6, 'Dormitorio Principal Suite', '4K', 2500000, 38.50, 8.9, 'Aprobado'),
(7, 'Bar & Lounge Iluminación', '4K', 3800000, 72.00, 8.2, 'Pendiente');