use animacion_3d_vistas_db;

insert into animadores (nombre_completo, especialidad, correo, nivel) values
('Angela Arrivillaga', 'Rigging & Technical Art', 'angela.arrivillaga@campus.3d.com', 'senior'),
('Jinx Chaosmaker', 'FX & Explosions', 'jinx.chaos@campus.3d.com', 'lead'),
('Cyber Valka', 'Character Modeling', 'valka.cyber@campus.3d.com', 'semi-senior'),
('Ghibli Dreamer', 'Environment & Lighting', 'ghibli.dream@campus.3d.com', 'senior'),
('Neon Brush', 'Character Animation', 'neon.brush@campus.3d.com', 'junior'),
('Hollow Knight Fan', 'Shading & LookDev', 'hollow.knight@campus.3d.com', 'semi-senior');

insert into software_3d (nombre_software, desarrollador, tipo_motor) values
('Autodesk Maya', 'Autodesk', 'offline_renderer'),
('Blender', 'Blender Foundation', 'hybrid'),
('Unreal Engine 5', 'Epic Games', 'realtime_engine'),
('Houdini', 'SideFX', 'offline_renderer'),
('ZBrush', 'Maxon', 'offline_renderer');

insert into proyectos_animacion (id_animador, id_software, nombre_proyecto, frames_totales, fps_configurados, presupuesto_usd, estado_proyecto, fecha_entrega) values
(1, 1, 'Cyberpunk Rigging Showreel 2026', 1440, 24, 4500.00, 'completado', '2026-03-15'),
(2, 4, 'Zaun Chemical Explosion FX', 720, 30, 8900.50, 'renderizando', '2026-09-10'),
(3, 5, 'Coquette Monster ZBrush Sculpt', 240, 24, 1200.00, 'en_desarrollo', '2026-10-01'),
(4, 2, 'Totoro Forest Ghibli Lighting', 2160, 24, 6200.00, 'completado', '2026-04-20'),
(5, 3, 'Neon Alley Parkour UE5 Cinematic', 1800, 60, 11500.00, 'en_desarrollo', '2026-11-30'),
(1, 2, 'Soft Girl Character LookDev', 480, 24, 2500.00, 'completado', '2026-05-12'),
(6, 1, 'Abyss Knight Animation Test', 960, 24, 3400.00, 'en_desarrollo', '2026-08-30'),
(2, 3, 'Arcane Fire Simulation Realtime', 3600, 60, 15000.00, 'renderizando', '2026-12-15'),
(4, 5, 'Dragon Scale High-Poly Sculpt', 120, 24, 1800.00, 'cancelado', '2026-02-10'),
(3, 1, 'Valkyrie Armor Hard Surface', 720, 24, 4100.00, 'completado', '2026-06-30');

insert into assets_3d (nombre_asset, tipo_asset, poligonos) values
('Main Character Jinx Rig', 'personaje', 85000),
('Cyberpunk Heavy Mech', 'personaje', 240000),
('Neon Street Lamppost', 'prop', 4500),
('Zaun Ruined Pipe Wall', 'escenario', 18000),
('Ghibli Ancient Tree', 'escenario', 95000),
('Hollow Knight Nail Weapon', 'prop', 1200),
('Facial Blendshapes Rig', 'rig_facial', 35000);

insert into proyectos_assets (id_proyecto, id_asset, cantidad_instancias) values
(1, 2, 1), (1, 3, 4), (1, 7, 1),
(2, 4, 12), (2, 3, 6),
(3, 2, 1), (3, 7, 1),
(4, 5, 8), (4, 3, 3),
(5, 1, 1), (5, 3, 15), (5, 4, 8),
(6, 1, 1), (6, 7, 1),
(7, 6, 2), (7, 5, 3),
(8, 4, 20), (8, 2, 2),
(9, 2, 1),
(10, 1, 1), (10, 7, 1);