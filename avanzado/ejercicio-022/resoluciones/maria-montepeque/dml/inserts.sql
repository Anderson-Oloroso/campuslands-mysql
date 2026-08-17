-- Datos de practica: proyectos y renders de un estudio de animacion 3D.
USE campuslands_mysql;

INSERT INTO proyectos_avanzado (nombre, cliente, motor_render, presupuesto, fecha_entrega, estado) VALUES
('Cortometraje El Viaje', 'Estudio Andino', 'Blender Cycles', 15000.00, '2026-04-01', 'en_progreso'),
('Comercial Bebida X', 'Marca Fresca', 'Arnold', 8000.00, '2026-02-15', 'entregado'),
('Serie Animada Piloto', 'Canal Kids', 'Redshift', 22000.00, '2026-05-20', 'en_progreso'),
('Videojuego Cinematica', 'Indie Games SAS', 'V-Ray', 12000.00, '2026-03-10', 'cancelado'),
('Documental VFX', 'Estudio Andino', 'Octane', 18000.00, '2026-06-01', 'en_progreso');

INSERT INTO renders_avanzado (id_proyecto, resolucion, tiempo_render_min, costo_computo, fecha_render, estado) VALUES
(1, '4K', 120, 45.00, '2026-01-10', 'exitoso'),
(1, '4K', 130, 48.00, '2026-01-20', 'fallido'),
(1, '8K', 240, 90.00, '2026-02-05', 'exitoso'),
(2, '2K', 60, 20.00, '2026-01-15', 'exitoso'),
(2, '2K', 65, 22.00, '2026-01-25', 'exitoso'),
(3, '4K', 150, 55.00, '2026-03-01', 'exitoso'),
(3, '4K', 140, 50.00, '2026-03-10', 'fallido'),
(4, '1080p', 40, 10.00, '2026-02-01', 'exitoso'),
(5, '8K', 300, 110.00, '2026-04-05', 'fallido'),
(5, '8K', 280, 100.00, '2026-04-15', 'exitoso');

-- Actualizacion a traves de la vista actualizable: sigue cumpliendo
-- estado = 'en_progreso' despues del cambio, asi que WITH CHECK OPTION
-- la permite sin problema.
UPDATE vw_proyectos_en_progreso_avanzado
SET presupuesto = 16000.00
WHERE id_proyecto = 1;
