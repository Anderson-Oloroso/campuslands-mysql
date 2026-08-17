-- Datos de practica: producciones y entregas de un estudio de animacion 3D.
USE campuslands_mysql;

INSERT INTO producciones_avanzado (nombre, cliente, motor_render, presupuesto, fecha_entrega, estado) VALUES
('Pelicula Ecos del Bosque', 'Estudio Andino', 'Blender Cycles', 16000.00, '2026-04-01', 'activa'),
('Anuncio Bebida Fresca', 'Marca Fresca', 'Arnold', 8500.00, '2026-02-15', 'entregada'),
('Serie Aventura Espacial', 'Canal Kids', 'Redshift', 23000.00, '2026-05-20', 'activa'),
('Videojuego Cinematica Ruinas', 'Indie Games SAS', 'V-Ray', 12500.00, '2026-03-10', 'cancelada'),
('Documental Naturaleza Viva', 'Estudio Andino', 'Octane', 19000.00, '2026-06-01', 'activa');

INSERT INTO entregas_avanzado (id_produccion, resolucion, tiempo_render_min, costo_computo, fecha_entrega, estado) VALUES
(1, '4K', 125, 47.00, '2026-01-10', 'exitosa'),
(1, '4K', 135, 50.00, '2026-01-20', 'fallida'),
(1, '8K', 250, 92.00, '2026-02-05', 'exitosa'),
(2, '2K', 62, 21.00, '2026-01-15', 'exitosa'),
(2, '2K', 68, 23.00, '2026-01-25', 'exitosa'),
(3, '4K', 155, 57.00, '2026-03-01', 'exitosa'),
(3, '4K', 145, 52.00, '2026-03-10', 'fallida'),
(4, '1080p', 42, 11.00, '2026-02-01', 'exitosa'),
(5, '8K', 305, 112.00, '2026-04-05', 'fallida'),
(5, '8K', 285, 102.00, '2026-04-15', 'exitosa');

-- Actualizacion a traves de la vista actualizable: sigue cumpliendo
-- estado = 'activa' despues del cambio, asi que WITH CHECK OPTION
-- la permite sin problema.
UPDATE vw_producciones_activas_avanzado
SET presupuesto = 17000.00
WHERE id_produccion = 1;
