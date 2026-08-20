USE campuslands_mysql;

-- Inserción de Animadores
INSERT INTO animadores (nombre, apellido, email, especialidad) VALUES
('Mateo', 'García', 'mateo.garcia@3dstudios.com', 'Keyframe Animation'),
('Elena', 'Torres', 'elena.torres@3dstudios.com', 'Lighting'),
('Gabriel', 'Ríos', 'gabriel.rios@3dstudios.com', 'VFX'),
('Lucía', 'Morales', 'lucia.morales@3dstudios.com', 'Rigging'),
('Carlos', 'López', 'carlos.lopez@3dstudios.com', 'Texturizado');

-- Inserción de Motores de Render (Entidad independiente para garantizar 2FN)
INSERT INTO motores_render (nombre_engine, desarrollador, licencia, costo_licencia_usd) VALUES
('Blender Cycles', 'Blender Foundation', 'Open Source', 0.00),
('Autodesk Arnold', 'Autodesk', 'Suscripción', 380.00),
('Redshift', 'Maxon', 'Suscripción', 264.00),
('Unreal Engine 5', 'Epic Games', 'Comercial', 0.00),
('OctaneRender', 'OTOY', 'Suscripción', 239.00);

-- Inserción de Proyectos de Animación 3D
INSERT INTO proyectos_animacion (titulo_proyecto, cliente, fps, fecha_inicio, estado) VALUES
('CORTOMETRAJE: El Despertar del Dragón', 'Pixar Shorts', 24, '2026-01-10', 'Renderizado'),
('COMERCIAL: Auto Concepto Neon 2027', 'CyberDrive Inc', 60, '2026-02-01', 'Producción'),
('CINEMÁTICA: Mech Warrior Odyssey', 'GameVerse Studios', 30, '2026-03-15', 'Producción'),
('SERIE TV: Misión Espacial Niños', 'DreamStream', 24, '2026-04-05', 'Preproducción');

-- Inserción de Escenas 3D
INSERT INTO escenas_3d (proyecto_id, nombre_escena, duracion_cuadros, nivel_complejidad) VALUES
(1, 'ESC_01_Vuelo_Sobre_Montanas', 720, 'Alta'),
(1, 'ESC_02_Cueva_Cristales', 480, 'Extrema'),
(2, 'ESC_01_Car_Chase_Ciudad', 1800, 'Extrema'),
(2, 'ESC_02_CloseUp_Faros', 300, 'Media'),
(3, 'ESC_01_Batalla_Hangar', 1200, 'Alta'),
(3, 'ESC_02_Explosion_Reactor', 600, 'Extrema'),
(4, 'ESC_01_Lanzamiento_Cohete', 900, 'Alta'),
(4, 'ESC_02_Orbita_Lunar', 450, 'Baja');

-- Inserción de Asignaciones de Render (Cumpliendo 2FN: Atributos métricos dependen 100% del trío Escena-Animador-Motor)
INSERT INTO asignaciones_render (escena_id, animador_id, motor_id, horas_computo_render, cuadros_renderizados, puntuacion_calidad) VALUES
(1, 1, 1, 14.50, 720, 9),
(1, 2, 2, 22.00, 720, 10),
(2, 2, 3, 35.00, 480, 10),
(2, 3, 3, 18.50, 480, 8),
(3, 3, 4, 12.00, 1800, 9),
(3, 5, 3, 28.00, 1800, 9),
(4, 2, 2, 5.50, 300, 8),
(5, 1, 1, 16.00, 1200, 9),
(6, 3, 3, 42.00, 600, 10),
(7, 4, 1, 8.00, 900, 7);