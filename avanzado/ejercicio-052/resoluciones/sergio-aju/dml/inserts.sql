USE campuslands_mysql;

-- Proyectos
INSERT INTO proyectos_3d (nombre, software_principal, fps, presupuesto_usd, estado) VALUES
('Cybernetic City Short Film', 'Blender', 24, 45000.00, 'Producción'),
('Mech Assault Game Cinematics', 'Unreal Engine', 60, 120000.00, 'Renderizado'),
('Ancient Dragon Commercial', 'Houdini', 30, 30000.00, 'Preproducción'),
('Deep Space Odyssey', 'Maya', 24, 85000.00, 'Producción');

-- Animadores / Artistas
INSERT INTO animadores (nombre, especialidad, nivel, costo_hora) VALUES
('Carlos "Poly" Mendoza', 'Modeling', 'Senior', 45.00),
('Sofia Rigging', 'Rigging', 'Lead', 60.00),
('David Lighting', 'Lighting', 'Mid', 35.00),
('Elena VFX', 'VFX', 'Senior', 50.00);

-- Modelos y Assets 3D
INSERT INTO modelos_3d (proyecto_id, animador_id, nombre_asset, conteo_poligonos, tiene_rigging, estado) VALUES
(1, 1, 'Cyber Hero Body', 125000, 1, 'Aprobado'),
(1, 2, 'Cyber Hoverbike', 85000, 1, 'Rigged'),
(2, 1, 'Heavy Mech Unit', 450000, 1, 'Aprobado'),
(2, 1, 'Futuristic Tower', 320000, 0, 'Texturizado'),
(3, 1, 'Dragon Creature Base', 280000, 1, 'Modelado'),
(4, 2, 'Space Explorer Suit', 95000, 1, 'Rigged'),
(4, 1, 'Spaceship Exterior', 620000, 0, 'Aprobado'),
(1, 3, 'City Background Buildings', 180000, 0, 'Texturizado');

-- Render Jobs
INSERT INTO render_jobs (proyecto_id, fotogramas_totales, minutos_render_farm, costo_render_usd, motor_render, estado) VALUES
(1, 1200, 480.50, 240.25, 'Cycles', 'Exitoso'),
(2, 3600, 720.00, 540.00, 'Redshift', 'Exitoso'),
(2, 1800, 310.00, 232.50, 'Redshift', 'Exitoso'),
(4, 2400, 1100.00, 660.00, 'Arnold', 'Exitoso'),
(3, 600, 180.00, 90.00, 'Karma', 'Fallido'),
(1, 600, 210.00, 105.00, 'Cycles', 'Exitoso');