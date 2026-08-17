-- DML: Múltiples sintaxis de INSERT para poblar el registro de saltos
USE campuslands_mysql;

-- Inserción multilínea
INSERT INTO registro_saltos_basico (codigo_salto, paracaidista_nombre, modalidad, altura_pies, costo_usd, estado, fecha_salto) VALUES
('SAL-2026-001', 'Carlos Mendoza', 'tandem', 10000, 180.00, 'completado', '2026-07-01 09:00:00'),
('SAL-2026-002', 'Valeria Gómez', 'solo', 12000, 120.00, 'completado', '2026-07-02 10:30:00'),
('SAL-2026-003', 'Mateo Fernández', 'freefly', 13000, 150.00, 'completado', '2026-07-05 11:15:00'),
('SAL-2026-004', 'Sofia López', 'tandem', 10000, 180.00, 'completado', '2026-07-08 12:00:00'),
('SAL-2026-005', 'Lucía Gómez', 'wing suit', 15000, 220.00, 'programado', '2026-07-15 14:00:00'),
('SAL-2026-006', 'Andrea Torres', 'formación', 14000, 160.00, 'completado', '2026-07-18 15:30:00'),
('SAL-2026-007', 'Diego Arriola', 'tandem', 9000, 170.00, 'cancelado', '2026-07-20 16:00:00'),
('SAL-2026-008', 'Gabriel Estrada', 'freefly', 13500, 150.00, 'programado', '2026-07-22 17:00:00');
