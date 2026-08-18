INSERT INTO centros_salto (nombre_centro, aeropuerto_base, ciudad, pais) VALUES
('Skydive Guatemala', 'Aeródromo de San José', 'Escuintla', 'Guatemala'),
('Skydive Playa', 'Aeródromo de Playa del Carmen', 'Playa del Carmen', 'México'),
('Skydive Dubai', 'Desert Dropzone', 'Dubái', 'Emiratos Árabes Unidos');

INSERT INTO instructores_paracaidismo (licencia_uspa, nombre_completo, total_saltos_acumulados, es_activo) VALUES
('USPA-D-12345', 'Marcos Antonio Estrada', 3500, TRUE),
('USPA-D-67890', 'Valeria Sofia Morales', 1800, TRUE),
('USPA-D-54321', 'Rodrigo Alejandro Gómez', 4200, TRUE);

INSERT INTO clientes_paracaidistas (pasaporte_dni, nombre_completo, email, telefono) VALUES
('A98765432', 'Diego Fernando López', 'diego.lopez@email.com', '+502 5555-4444'),
('B12345678', 'Camila Isabel Ruiz', 'camila.ruiz@email.com', '+502 5555-6666'),
('C45612378', 'Gabriel Andrés Méndez', 'gabriel.mendez@email.com', '+502 5555-8888');

INSERT INTO saltos_paracaidismo (centro_id, instructor_id, cliente_id, modalidad, altitud_pies, fecha_hora_salto, precio_usd) VALUES
(1, 1, 1, 'Tándem', 10000, '2026-08-15 09:30:00', 225.00),
(1, 2, 2, 'AFF Solo', 13000, '2026-08-15 11:00:00', 290.00),
(2, 3, 3, 'Tándem', 14000, '2026-08-17 14:15:00', 350.00),
(1, 1, 3, 'Relativo', 12000, '2026-08-18 10:00:00', 180.00);