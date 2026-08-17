-- DML: Registro de tatuadores y citas para probar subconsultas
USE campuslands_mysql;

INSERT INTO tatuadores_subconsultas (codigo_tatuador, nombre, especialidad, tarifa_hora) VALUES
('TAT-001', 'Sebastián Morales', 'blackwork', 75.00),
('TAT-002', 'Camila Orellana', 'fine line', 60.00),
('TAT-003', 'Rodrigo Arriola', 'realismo', 100.00),
('TAT-004', 'Valeria Estrada', 'neotradicional', 70.00);

INSERT INTO citas_subconsultas (codigo_cita, tatuador_id, cliente_nombre, estilo, monto_total, estado, fecha_cita) VALUES
('CIT-SUB-001', 1, 'Carlos Méndez', 'blackwork', 225.00, 'completada', '2026-07-01'),
('CIT-SUB-002', 2, 'Sofia Castillo', 'fine line', 120.00, 'completada', '2026-07-02'),
('CIT-SUB-003', 3, 'Diego Fernández', 'realismo', 600.00, 'completada', '2026-07-05'),
('CIT-SUB-004', 4, 'Andrea Ruiz', 'neotradicional', 280.00, 'programada', '2026-07-10'),
('CIT-SUB-005', 1, 'Gabriel Torres', 'blackwork', 187.50, 'completada', '2026-07-12'),
('CIT-SUB-006', 2, 'Lucía Gómez', 'fine line', 90.00, 'cancelada', '2026-07-15'),
('CIT-SUB-007', 3, 'Mariana López', 'realismo', 800.00, 'programada', '2026-07-20'),
('CIT-SUB-008', 4, 'Mateo Estrada', 'neotradicional', 245.00, 'completada', '2026-07-22'),
('CIT-SUB-009', 1, 'Fernando Sandoval', 'blackwork', 375.00, 'programada', '2026-07-25');
