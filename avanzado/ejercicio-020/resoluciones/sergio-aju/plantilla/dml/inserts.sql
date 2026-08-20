USE campuslands_mysql;

-- Inserción de 8 registros de citas de tatuajes
INSERT INTO citas_tatuajes (cliente, estilo_diseno, zona_cuerpo, duracion_horas, costo_total, calificacion, fecha_cita, estado) VALUES
('Andrea Gómez', 'Realismo B&G', 'Espalda', 5.0, 375.00, 4.90, '2026-08-01', 'completada'),
('Fernando Ruiz', 'Realismo B&G', 'Brazo', 4.0, 300.00, 4.80, '2026-08-03', 'completada'),
('Camila Torres', 'Fine Line', 'Antebrazo', 2.5, 150.00, 4.95, '2026-08-05', 'completada'),
('Mateo Morales', 'Neotradicional', 'Pierna', 3.5, 210.00, 4.70, '2026-08-08', 'completada'),
('Lucía Méndez', 'Traditional / Old School', 'Pecho', 2.0, 110.00, 4.60, '2026-08-10', 'completada'),
('Jorge Blanco', 'Traditional / Old School', 'Hombro', 3.0, 165.00, 4.85, '2026-08-12', 'pendiente'),
('Mariana López', 'Realismo B&G', 'Costillas', 6.0, 450.00, 5.00, '2026-08-14', 'completada'),
('Gabriel Cruz', 'Geométrico / Blackwork', 'Cuello', 3.0, 150.00, 4.20, '2026-08-15', 'cancelada');