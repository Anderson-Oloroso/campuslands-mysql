USE campuslands_mysql;

-- Inserción de al menos 8 registros de órdenes de servicio con variaciones de costo para probar subconsultas escalares, correlacionadas y de conjunto
INSERT INTO taller_mecanico_subconsultas (codigo_orden, propietario, marca_moto, modelo_moto, tipo_servicio, costo_servicio, fecha_ingreso, estado_reparacion) VALUES
('ORD-001', 'Carlos Pérez', 'Yamaha', 'FZ 25', 'Mantenimiento General y Cambio de Aceite', 120.50, '2026-08-01', 'entregado'),
('ORD-002', 'María Gómez', 'Honda', 'CB 190R', 'Sincronización y Limpieza de Inyectores', 180.00, '2026-08-05', 'completado'),
('ORD-003', 'Luis Martínez', 'Suzuki', 'GIXXER 250', 'Cambio de Kit de Arrastre y Frenos', 250.75, '2026-08-10', 'en_proceso'),
('ORD-004', 'Ana Rodríguez', 'Kawasaki', 'KLR 650', 'Reparación de Suspensión Delantera', 450.00, '2026-08-12', 'pendiente'),
('ORD-005', 'Jorge Ramírez', 'Yamaha', 'MT-03', 'Diagnóstico de Sistema Eléctrico', 90.00, '2026-08-14', 'en_proceso'),
('ORD-006', 'Sofía Torres', 'Bajaj', 'Pulsar NS 200', 'Cambio de Llantas y Alineación', 210.25, '2026-08-15', 'completado'),
('ORD-007', 'David Morales', 'TVS', 'Apache RTR 200', 'Mantenimiento Preventivo 10,000 km', 140.00, '2026-08-16', 'pendiente'),
('ORD-008', 'Elena Castro', 'Honda', 'XR 190L', 'Reparación de Sistema de Transmisión', 310.00, '2026-08-18', 'pendiente');