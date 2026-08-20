INSERT INTO artistas_tatuajes (nombre_artistico, especialidad_estilo, telefono, email, es_activo) VALUES
('Black Ink Studio - Alex', 'Realismo Black and Grey', '+502 5555-1122', 'alex.ink@estudio.com', TRUE),
('Maya Art - Sofia', 'Neotradicional y Color', '+502 5555-3344', 'sofia.art@estudio.com', TRUE),
('Line Work - Carlos', 'Minimalista y Geometry', '+502 5555-5566', 'carlos.line@estudio.com', TRUE);

INSERT INTO clientes_tatuajes (documento_identidad, nombre_completo, telefono, email, fecha_nacimiento) VALUES
('DPI-101010101', 'Fernando José Alvarado', '+502 4444-1111', 'fernando.alvarado@email.com', '1995-04-12'),
('DPI-202020202', 'María Jimena Castillo', '+502 4444-2222', 'jimena.castillo@email.com', '1998-09-25'),
('DPI-303030303', 'Roberto Carlos Fuentes', '+502 4444-3333', 'roberto.fuentes@email.com', '1992-11-05');

INSERT INTO citas_tatuaje (artista_id, cliente_id, estilo_diseño, zona_cuerpo, tamano_cm, costo_estimado_usd, fecha_hora_cita, estado_cita) VALUES
(1, 1, 'Realismo', 'Antebrazo', 15.00, 250.00, '2026-08-10 10:00:00', 'Completada'),
(2, 2, 'Neotradicional', 'Espalda alta', 20.00, 350.00, '2026-08-12 14:30:00', 'Completada'),
(3, 3, 'Minimalista', 'Muñeca', 5.00, 80.00, '2026-08-15 11:00:00', 'Completada'),
(1, 2, 'Black and Grey', 'Muro pectoral', 18.00, 300.00, '2026-08-20 16:00:00', 'Agendada'),
(2, 1, 'Color tradicional', 'Pantorrilla', 12.00, 200.00, '2026-08-22 09:00:00', 'Agendada');