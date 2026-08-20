USE campuslands_mysql;

-- Inserción de Firmas de Arquitectura (Normalización 3FN)
INSERT INTO firmas_arquitectura (nombre_firma, pais_origen, software_bim_preferido) VALUES
('Foster + Partners', 'Reino Unido', 'Revit'),
('Zaha Hadid Architects', 'Reino Unido', 'Rhinoceros 3D'),
('Studio Elemental', 'Chile', 'Archicad'),
('Gensler Digital', 'Estados Unidos', 'Revit'),
('Snohetta Design', 'Noruega', 'Vectorworks');

-- Inserción de Categorías de Espacio / Tipologías
INSERT INTO categorias_espacio (nombre_categoria, norma_construccion_aplicable, es_espacio_publico) VALUES
('Residencial Multifamiliar', 'ISO-NC-2024-Vivienda', FALSE),
('Comercial & Retail', 'ISO-NC-2022-Comercio', TRUE),
('Corporativo / Oficinas', 'ISO-NC-2023-Oficinas', FALSE),
('Infraestructura Cultural', 'ISO-NC-2025-Equipamiento', TRUE),
('Paisajismo Urbano', 'ISO-NC-2021-Urbana', TRUE);

-- Inserción de Arquitectos
INSERT INTO arquitectos (firma_id, nombre, apellido, email, licencia_profesional) VALUES
(1, 'Alejandro', 'Vargas', 'a.vargas@foster.com', 'ARQ-UK-88491'),
(2, 'Beatriz', 'Pineda', 'b.pineda@zaha.com', 'ARQ-UK-90214'),
(3, 'Camilo', 'Fuentes', 'c.fuentes@elemental.cl', 'ARQ-CL-10492'),
(4, 'Diana', 'Gómez', 'd.gomez@gensler.com', 'ARQ-US-33810'),
(1, 'Esteban', 'Soto', 'e.soto@foster.com', 'ARQ-UK-77312');

-- Inserción de Modelos 3D Arquitectónicos
INSERT INTO modelos_3d (arquitecto_id, categoria_id, nombre_proyecto, superficie_m2, costo_estimado_usd, escala, fecha_aprobacion, estado) VALUES
(1, 3, 'Torre Financiera Skyline', 15400.50, 12500000.00, '1:200', '2026-01-15', 'En Construcción'),
(2, 4, 'Centro Cultural de las Artes', 8200.00, 7800000.00, '1:100', '2026-02-10', 'Aprobado'),
(3, 1, 'Conjunto Habitacional Borde Mar', 4500.75, 3200000.00, '1:100', '2026-02-28', 'En Construcción'),
(4, 2, 'Mall Plaza Innovación', 22000.00, 18900000.00, '1:500', '2026-03-12', 'Aprobado'),
(1, 1, 'Villa Ecológica Bosque Real', 1200.00, 950000.00, '1:50', '2026-04-01', 'En Revisión'),
(5, 5, 'Parque Lineal Metropolitano', 35000.00, 5400000.00, '1:1000', '2026-04-18', 'Aprobado'),
(2, 3, 'Hub Tecnológico Boreal', 9800.00, 8900000.00, '1:200', '2026-05-02', 'En Revisión'),
(3, 1, 'Casa Modular Sustentable', 320.00, 280000.00, '1:20', '2026-05-20', 'Boceto');

-- Inserción de Render de Escenas
INSERT INTO render_escenas (modelo_id, nombre_vista, motor_render, tiempo_render_minutos, resolucion_k) VALUES
(1, 'Vista Aérea Diurna', 'Unreal Engine 5', 45.00, '8K'),
(1, 'Lobby Interior Fachada', 'V-Ray', 120.00, '4K'),
(2, 'Auditorio Principal Corte 3D', 'Corona Render', 90.00, '4K'),
(3, 'Fachada Norte Atardecer', 'Enscape', 25.00, '2K'),
(4, 'Plaza Central Nocturna', 'V-Ray', 210.00, '8K'),
(5, 'Corte Esquemático Estructural', 'Twinmotion', 30.00, '2K'),
(6, 'Perspectiva Peatonal', 'Unreal Engine 5', 60.00, '4K'),
(7, 'Atrio Central Tragaluz', 'V-Ray', 140.00, '4K');