INSERT INTO turistas (nombre_turista, pasaporte, nacionalidad, correo) VALUES
('Elena Rostova', 'PAS-RU-9921', 'Rusia', 'elena.rostova@email.com'),
('John Miller', 'PAS-US-8812', 'Estados Unidos', 'john.miller@email.com'),
('Carlos Mendoza', 'PAS-GT-3341', 'Guatemala', 'carlos.mendoza@email.com'),
('Sophie Dubois', 'PAS-FR-5510', 'Francia', 'sophie.dubois@email.com');

INSERT INTO destinos_turisticos (nombre_destino, pais, region, categoria) VALUES
('Antigua Guatemala', 'Guatemala', 'Sacatepéquez', 'Cultura'),
('Tikal', 'Guatemala', 'Petén', 'Cultura'),
('Lago de Atitlán', 'Guatemala', 'Sololá', 'Aventura'),
('Cayo Caulker', 'Belice', 'Distrito Belice', 'Playa');

INSERT INTO guias_turismo (nombre_guia, idioma_principal, anos_experiencia, tarifa_diaria_usd) VALUES
('Mateo Morales', 'Español / Inglés', 8, 45.00),
('Lucía Asturias', 'Inglés / Francés', 5, 50.00),
('Diego Hernández', 'Español / Alemán', 12, 65.00);

INSERT INTO tours_disponibles (destino_id, guia_id, codigo_tour, nombre_tour, duracion_dias, precio_base_usd, cupo_maximo) VALUES
(1, 1, 'TUR-ANT-01', 'Recorrido Histórico por Antigua', 2, 120.00, 15),
(2, 2, 'TUR-TIK-02', 'Expedición Arqueológica Tikal', 3, 350.00, 10),
(3, 1, 'TUR-ATI-03', 'Aventura y Senderismo en Atitlán', 4, 280.00, 12),
(4, 3, 'TUR-CAY-04', 'Snorkeling y Relax en Cayo Caulker', 5, 500.00, 8);

INSERT INTO reservas_tours (tour_id, turista_id, codigo_reserva, fecha_reserva, fecha_viaje, numero_personas, monto_total_usd, estado_reserva) VALUES
(1, 1, 'RES-2026-001', '2026-08-01', '2026-08-25', 2, 240.00, 'Confirmada'),
(2, 2, 'RES-2026-002', '2026-08-05', '2026-09-10', 1, 350.00, 'Confirmada'),
(2, 3, 'RES-2026-003', '2026-08-10', '2026-09-10', 3, 1050.00, 'Confirmada'),
(3, 4, 'RES-2026-004', '2026-08-12', '2026-08-20', 2, 560.00, 'Completada'),
(4, 1, 'RES-2026-005', '2026-08-15', '2026-10-01', 1, 500.00, 'Pendiente');