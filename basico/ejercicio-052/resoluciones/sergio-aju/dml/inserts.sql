USE campuslands_mysql;

-- Limpieza de registros previos por seguridad antes de la inserción
TRUNCATE TABLE proyectos_animacion_3d;

-- Inserción de al menos 8 registros de proyectos de animación 3D para probar ordenamientos y jerarquías
INSERT INTO proyectos_animacion_3d (codigo_proyecto, nombre_secuencia, software_empleado, fotogramas_totales, tiempo_render_horas, presupuesto_usd, calificacion_calidad, estado_proyecto) VALUES
('ANI-001', 'Vuelo del Dragon Epico', 'Blender', 1800, 45.5, 3500.00, 4.9, 'renderizado'),
('ANI-002', 'Persecucion en Callejon Cyber', 'Maya', 1200, 30.0, 2800.00, 4.7, 'renderizado'),
('ANI-003', 'Simulacion de Explosion Volcanica', 'Houdini', 2400, 96.0, 6000.00, 5.0, 'en_composicion'),
('ANI-004', 'Monstruo Organico Esculpido', 'ZBrush', 600, 12.5, 1200.00, 4.5, 'en_produccion'),
('ANI-005', 'Movimiento de Camara Abstracto', 'Cinema 4D', 900, 18.0, 1500.00, 4.6, 'renderizado'),
('ANI-006', 'Batalla Mecha Espacial', 'Blender', 3000, 120.0, 7500.00, 4.8, 'en_composicion'),
('ANI-007', 'Secuencia de Texto 3D Motion', 'Cinema 4D', 450, 8.0, 800.00, 4.3, 'en_produccion'),
('ANI-008', 'Bosque Encantado Mistico', 'Maya', 1500, 50.0, 3200.00, 4.8, 'renderizado');