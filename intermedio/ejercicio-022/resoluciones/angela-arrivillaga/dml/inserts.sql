use animacion_3d_db;

insert into motores_render (nombre_motor, empresa_desarrolladora, version_actual) values
('Blender Cycles', 'Blender Foundation', '4.2.0'),
('Unreal Engine', 'Epic Games', '5.4.0'),
('Autodesk Arnold', 'Autodesk', '7.3.0'),
('Chaos V-Ray', 'Chaos Group', '6.20.0');

insert into proyectos_animacion (codigo_proyecto, titulo_proyecto, id_motor, fotogramas_totales, duracion_segundos, estado_produccion) values
('PRJ-3D-01', 'Cyberpunk Mech Chase Scene', 2, 2160, 90.00, 'finalizado'),
('PRJ-3D-02', 'Hollow Knight Deepnest Cinematic', 1, 1440, 60.00, 'finalizado'),
('PRJ-3D-03', 'Ghibli Style Sky Island Flight', 1, 3600, 150.00, 'en_render'),
('PRJ-3D-04', 'Sci-Fi Spacecraft Docking Sequence', 3, 1800, 75.50, 'post_produccion'),
('PRJ-3D-05', 'Coquette Stylized Living Room', 4, 720, 30.00, 'pre_produccion'),
('PRJ-3D-06', 'Neon Synthwave Highway Drift', 2, 1080, 45.00, 'finalizado'),
('PRJ-3D-07', 'Fantasy Dragon Fire Breath', 3, 2400, 100.00, 'en_render'),
('PRJ-3D-08', 'Kawaii Cat Cafe Virtual Tour', 1, 960, 40.00, 'post_produccion');

insert into renders_secuencias (id_proyecto, nombre_secuencia, resolucion_salida, tiempo_render_horas, peso_gigabytes) values
(1, 'Secuencia_A_Ciudad', '3840x2160', 14.50, 45.20),
(1, 'Secuencia_B_Combate', '3840x2160', 22.10, 68.40),
(2, 'Secuencia_Abismo_Inicio', '2560x1440', 8.20, 19.50),
(3, 'Secuencia_Vuelo_Nubes', '3840x2160', 35.00, 110.00),
(4, 'Secuencia_Hangar_Estelar', '1920x1080', 18.30, 32.10),
(5, 'Secuencia_Interior_Habitacion', '1920x1080', 5.40, 12.80),
(6, 'Secuencia_Carretera_Neon', '3840x2160', 10.20, 28.50),
(7, 'Secuencia_Cueva_Cenizas', '2560x1440', 27.80, 85.00),
(8, 'Secuencia_Cafeteria_Gatos', '1920x1080', 4.10, 9.20);