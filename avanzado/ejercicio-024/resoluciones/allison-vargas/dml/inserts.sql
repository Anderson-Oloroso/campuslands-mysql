USE soldadura_bloqueos_db;

-- Insercion de Estaciones
INSERT INTO estaciones_soldadura (codigo_estacion, tipo_proceso, estado) VALUES
('EST-001', 'SMAW', 'disponible'),
('EST-002', 'GMAW', 'en_uso'),
('EST-003', 'GTAW', 'disponible'),
('EST-004', 'FCAW', 'bloqueada_mantenimiento'),
('EST-005', 'GMAW', 'disponible');

-- Insercion de Insumos
INSERT INTO inventario_insumos (nombre_insumo, tipo_material, stock_kg, precio_por_kg) VALUES
('Electrodo E6013 1/8', 'Acero al Carbono', 500.00, 4.50),
('Electrodo E7018 5/32', 'Acero Estructural', 350.00, 5.80),
('Alambre ER70S-6 0.035', 'Acero Dulce', 800.00, 3.20),
('Varilla ER308L 1/16', 'Acero Inoxidable', 150.00, 12.50),
('Alambre E71T-1C 0.045', 'Tubular con Fundente', 400.00, 6.10);

-- Demostración de Transaccion con Bloqueo de Registros (FOR UPDATE)
START TRANSACTION;

-- Simulación de Bloqueo Exclusivo sobre insumos críticos
SELECT stock_kg FROM inventario_insumos WHERE id_insumo = 1 FOR UPDATE;

-- Registro de asignaciones aseguradas por la transaccion
INSERT INTO asignacion_insumos (id_estacion, id_insumo, cantidad_asignada_kg, fecha_asignacion) VALUES
(1, 1, 50.00, '2026-03-01 08:30:00'),
(2, 3, 120.00, '2026-03-01 09:15:00'),
(3, 4, 25.00, '2026-03-02 10:00:00'),
(5, 2, 80.00, '2026-03-02 11:30:00'),
(1, 5, 60.00, '2026-03-03 14:00:00'),
(2, 1, 40.00, '2026-03-03 15:45:00'),
(3, 4, 30.00, '2026-03-04 08:00:00'),
(5, 3, 100.00, '2026-03-04 13:20:00');

-- Actualizacion del stock restando lo asignado
UPDATE inventario_insumos SET stock_kg = stock_kg - 50.00 WHERE id_insumo = 1;

COMMIT;
