USE campuslands_mysql;

-- Limpieza de registros previos por seguridad antes de la inserción
TRUNCATE TABLE citas_tatuajes;

-- Inserción de al menos 8 registros de citas de tatuajes con variaciones de estilo, costos, duraciones y estados
INSERT INTO citas_tatuajes (codigo_cita, nombre_cliente, nombre_artista, estilo_tatuaje, tiempo_estimado_horas, costo_usd, calificacion_satisfaccion, fecha_cita, estado_cita) VALUES
('TAT-001', 'Alejandro Ruiz', 'Marco Vega', 'realismo', 5.5, 450.00, 4.9, '2026-06-05', 'completado'),
('TAT-002', 'Sofía Morales', 'Elena Vance', 'minimalista', 1.5, 120.00, 4.7, '2026-06-10', 'completado'),
('TAT-003', 'Daniel Castillo', 'Marco Vega', 'japones', 8.0, 750.00, 5.0, '2026-06-15', 'completado'),
('TAT-004', 'Camila Torres', 'Klaus Ink', 'neotradicional', 3.0, 280.00, 4.8, '2026-06-20', 'completado'),
('TAT-005', 'Mateo Vargas', 'Elena Vance', 'blackwork', 4.0, 350.00, 4.6, '2026-07-01', 'en_proceso'),
('TAT-006', 'Valeria Ríos', 'Klaus Ink', 'tradicional', 2.5, 200.00, 4.5, '2026-07-05', 'programada'),
('TAT-007', 'Gabriel Soto', 'Marco Vega', 'realismo', 6.0, 520.00, 4.9, '2026-07-10', 'programada'),
('TAT-008', 'Lucía Méndez', 'Elena Vance', 'minimalista', 2.0, 150.00, 4.3, '2026-07-12', 'cancelada');