-- Datos de practica. Puedes cambiarlos o agregar mas filas.
USE campuslands_mysql;

INSERT INTO artistas_tatuajes (nombre_artista, apodo_artistico, estilo_principal, anios_experiencia, tarifa_por_hora_usd) VALUES
('Alejandro Silva', 'Alex Ink', 'Neotradicional', 8, 90.00),
('Valeria Rivas', 'Val Tattoo', 'Realismo', 10, 120.00),
('Marcos Cabrera', 'DarkMark', 'Blackwork', 5, 75.00),
('Elena Fuentes', 'Lena Lines', 'Fine Line', 3, 60.00);

INSERT INTO clientes_tatuajes (nombre_cliente, correo, telefono, fecha_registro) VALUES
('Daniel Morales', 'daniel.morales@email.com', '+502 5555-1101', '2026-01-10'),
('Camila Salazar', 'camila.salazar@email.com', '+502 5555-1102', '2026-02-14'),
('Rodrigo Vega', 'rodrigo.vega@email.com', '+502 5555-1103', '2026-03-01'),
('Sonia Castillo', 'sonia.castillo@email.com', '+502 5555-1104', '2026-04-05');

INSERT INTO citas_tatuajes (artista_id, cliente_id, descripcion_disenio, zona_cuerpo, fecha_hora_cita, duracion_estimada_horas, monto_total_usd, estado_cita) VALUES
(1, 1, 'Jaguar Neotradicional', 'Antebrazo', '2026-05-10 10:00:00', 3.50, 315.00, 'Completada'),
(2, 2, 'Retrato Realista Tigre', 'Espalda', '2026-05-12 14:00:00', 6.00, 720.00, 'Completada'),
(2, 3, 'Cráneo Realista', 'Muslo', '2026-06-01 11:00:00', 5.00, 600.00, 'Completada'),
(3, 1, 'Brazalete Geométrico Blackwork', 'Brazo', '2026-06-20 15:00:00', 4.00, 300.00, 'Completada'),
(4, 4, 'Floral Minimila Fine Line', 'Costillas', '2026-07-05 10:00:00', 2.00, 120.00, 'Completada'),
(1, 2, 'Serpiente y Rosas', 'Pantorrilla', '2026-08-01 13:00:00', 4.00, 360.00, 'Programada');

INSERT INTO pagos_citas (cita_id, monto_pago_usd, metodo_pago, fecha_pago) VALUES
(1, 315.00, 'Efectivo', '2026-05-10 13:30:00'),
(2, 720.00, 'Tarjeta', '2026-05-12 20:00:00'),
(3, 600.00, 'Transferencia', '2026-06-01 16:00:00'),
(4, 300.00, 'Tarjeta', '2026-06-20 19:00:00'),
(5, 120.00, 'Efectivo', '2026-07-05 12:00:00');