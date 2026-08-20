USE campuslands_mysql;

INSERT INTO clientes_taller (nombre, telefono, email) VALUES
('juan perez', '3001234567', 'juan@email.com'),
('maria lopez', '3109876543', 'maria@email.com'),
('pedro gomez', '3201112233', 'pedro@email.com'),
('ana martinez', '3005554433', 'ana@email.com'),
('carlos ruiz', '3156667788', 'carlos@email.com');

INSERT INTO servicios_taller (cliente_id, tipo_servicio, costo, fecha_servicio, estado) VALUES
(1, 'cambio de aceite', 50.00, '2026-08-01', 'completado'),
(2, 'frenos', 120.00, '2026-08-05', 'completado'),
(1, 'ajuste cadena', 30.00, '2026-08-10', 'completado'),
(3, 'revision general', 200.00, '2026-08-12', 'en_proceso'),
(4, 'llantas', 150.00, '2026-08-15', 'completado'),
(5, 'cambio de aceite', 50.00, '2026-08-16', 'pendiente'),
(2, 'suspension', 300.00, '2026-08-17', 'pendiente'),
(4, 'frenos', 120.00, '2026-08-18', 'completado');