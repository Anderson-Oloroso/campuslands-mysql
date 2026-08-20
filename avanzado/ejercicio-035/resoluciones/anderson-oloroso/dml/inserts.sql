USE campuslands_mysql;

INSERT INTO servicios_taller (nombre_servicio, categoria, duracion_hrs, costo_base, estado) VALUES
('Alpha Advanced', 'Nivel 1', 'Director A', 5000.00, 'Activo'),
('Beta Advanced', 'Nivel 2', 'Director B', 7500.00, 'Activo'),
('Gamma Advanced', 'Nivel 1', 'Director C', 3200.00, 'Inactivo'),
('Delta Advanced', 'Nivel 3', 'Director D', 9100.00, 'Activo'),
('Epsilon Advanced', 'Nivel 2', 'Director E', 6400.00, 'Activo');

INSERT INTO ordenes_taller (servicio_id, cliente, estado_orden, monto_total) VALUES
(1, 'Log A1', 'Operacion', 120.00),
(1, 'Log A2', 'Operacion', 250.00),
(2, 'Log B1', 'Ajuste', 400.00),
(3, 'Log C1', 'Revisión', 150.00),
(4, 'Log D1', 'Operacion', 950.00),
(5, 'Log E1', 'Ajuste', 300.00);
