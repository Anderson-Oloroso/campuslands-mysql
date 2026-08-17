USE animacion_3d_2fn_db;

-- Insercion de Artistas
INSERT INTO artistas (nombre, especialidad, email) VALUES
('Carlos Ruiz', 'Rigging y Animacion', 'carlos.ruiz@anim.com'),
('Valeria Gomez', 'Lighting y Shading', 'valeria.gomez@anim.com'),
('Sofia Lopez', 'VFX y FX', 'sofia.lopez@anim.com'),
('Ana Martinez', 'Environment Artist', 'ana.martinez@anim.com');

-- Insercion de Motores de Render
INSERT INTO motores_render (nombre_engine, tipo, costo_base_hora) VALUES
('Blender Cycles', 'GPU', 15.00),
('Maya Arnold', 'CPU', 25.00),
('Houdini Mantra', 'CPU', 35.00),
('Unreal Engine 5', 'GPU', 10.00),
('Redshift', 'GPU', 20.00);

-- Insercion de 10 Proyectos de Render Relacionados
INSERT INTO proyectos_render (nombre_escena, id_artista, id_motor, total_frames, tiempo_horas, costo_total, estado, fecha_inicio) VALUES
('Batalla de Naves', 1, 1, 300, 12.50, 187.50, 'completado', '2026-03-01'),
('Boceto de Iluminacion', 2, 2, 120, 5.00, 125.00, 'completado', '2026-03-05'),
('Explosion Volumetrica', 3, 3, 240, 18.00, 630.00, 'completado', '2026-03-10'),
('Bosque FANTASY 4K', 4, 4, 600, 4.00, 40.00, 'completado', '2026-03-12'),
('Caminata Personaje Mech', 1, 5, 180, 8.50, 170.00, 'completado', '2026-03-15'),
('Simulacion Mar Profundo', 3, 3, 150, 14.00, 490.00, 'renderizando', '2026-03-18'),
('Retrato Hiperrealista', 2, 2, 90, 6.00, 150.00, 'completado', '2026-03-20'),
('Destruccion de Edificio', 1, 1, 450, 22.00, 330.00, 'completado', '2026-03-22'),
('Cinematica Interior UE5', 4, 4, 300, 2.50, 25.00, 'error', '2026-03-25'),
('Animacion Facial', 2, 5, 120, 4.50, 90.00, 'completado', '2026-03-28');