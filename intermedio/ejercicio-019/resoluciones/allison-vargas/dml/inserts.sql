-- DML: Registro de 9 saltos distribuidos por modalidad y zonas para probar condiciones de HAVING
USE campuslands_mysql;

INSERT INTO saltos_having (codigo_salto, instructor_nombre, modalidad, zona_salto, altura_pies, monto_usd, estado, fecha_salto) VALUES
('SKD-001', 'Mario Estrada', 'tandem', 'Zona Norte', 10000, 180.00, 'realizado', '2026-07-01'),
('SKD-002', 'Mario Estrada', 'freefly', 'Zona Norte', 13000, 150.00, 'realizado', '2026-07-02'),
('SKD-003', 'Elena Rostran', 'tandem', 'Zona Sur', 9500, 175.00, 'realizado', '2026-07-03'),
('SKD-004', 'Carlos Ruiz', 'solo', 'Zona Norte', 12000, 120.00, 'realizado', '2026-07-05'),
('SKD-005', 'Mario Estrada', 'wing suit', 'Zona Central', 15000, 220.00, 'realizado', '2026-07-08'),
('SKD-006', 'Elena Rostran', 'formación', 'Zona Sur', 14000, 160.00, 'realizado', '2026-07-10'),
('SKD-007', 'Carlos Ruiz', 'tandem', 'Zona Central', 10000, 180.00, 'cancelado', '2026-07-12'),
('SKD-008', 'Elena Rostran', 'freefly', 'Zona Sur', 13500, 150.00, 'realizado', '2026-07-15'),
('SKD-009', 'Mario Estrada', 'solo', 'Zona Norte', 11000, 130.00, 'realizado', '2026-07-18');
