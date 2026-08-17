USE animacion_3d_db;

-- Inserción de 10 registros realistas
INSERT INTO renders_3d 
(nombre_proyecto, artista, software_render, total_frames, tiempo_render_minutos, resolucion, costo_farm_usd, estado, fecha_render) 
VALUES
('Escena Batalla Mecha', 'Carlos Ruiz', 'Blender Cycles', 240, 180.50, '4K', 45.00, 'completado', '2026-03-01'),
('Caminata Personaje Stylized', 'Valeria Gómez', 'Maya Arnold', 120, 45.00, '1080p', 12.50, 'completado', '2026-03-05'),
('Simulación de Fuego y Humo', 'Sofia López', 'Houdini Mantra', 300, 420.00, '4K', 110.00, 'completado', '2026-03-10'),
('Interior Arquitectónico', 'Ana Martínez', 'Unreal Engine 5', 600, 15.20, '4K', 5.00, 'completado', '2026-03-12'),
('Vuelo de Nave Espacial', 'Carlos Ruiz', 'Blender Eevee', 480, 22.00, '1080p', 0.00, 'completado', '2026-03-15'),
('Explosión de Vehículo', 'Sofia López', 'Houdini Karma', 150, 210.00, '4K', 75.00, 'procesando', '2026-03-18'),
('Cerca de Rostro Facial', 'Valeria Gómez', 'Maya Redshift', 90, 85.00, '2K', 28.00, 'completado', '2026-03-20'),
('Demolición de Estructura', 'Carlos Ruiz', 'Blender Cycles', 360, 310.00, '4K', 80.00, 'completado', '2026-03-22'),
('Bucle de Vegetación Viento', 'Ana Martínez', 'Unreal Engine 5', 240, 8.50, '1080p', 0.00, 'fallido', '2026-03-25'),
('Transformación Mech', 'Sofia López', 'Octane Render', 180, 160.00, '4K', 55.00, 'completado', '2026-03-28');
