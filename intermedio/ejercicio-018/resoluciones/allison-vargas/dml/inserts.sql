-- DML: Carga de 9 registros con variabilidad de regiones, categorías y estados
USE campuslands_mysql;

INSERT INTO reservas_groupby (codigo_reserva, cliente_nombre, destino, region, categoria, monto_total, estado, fecha_reserva) VALUES
('RES-GUA-001', 'Carlos Mendoza', 'Tikal y Flores', 'Petén', 'cultural', 480.00, 'completada', '2026-06-01'),
('RES-GUA-002', 'Valeria Gómez', 'Lago de Atitlán', 'Sololá', 'ecoturismo', 255.00, 'completada', '2026-06-05'),
('RES-GUA-003', 'Mateo Fernández', 'Antigua Guatemala', 'Sacatepéquez', 'cultural', 380.00, 'confirmada', '2026-06-10'),
('RES-GUA-004', 'Sofia López', 'Semuc Champey', 'Alta Verapaz', 'aventura', 210.00, 'completada', '2026-06-12'),
('RES-GUA-005', 'Lucía Gómez', 'Playa de Monterrico', 'Santa Rosa', 'playa', 180.00, 'cancelada', '2026-06-15'),
('RES-GUA-006', 'Andrea Torres', 'Volcán de Acatenango', 'Chimaltenango', 'montaña', 150.00, 'completada', '2026-06-18'),
('RES-GUA-007', 'Diego Arriola', 'Río Dulce y Livingston', 'Izabal', 'ecoturismo', 440.00, 'confirmada', '2026-06-20'),
('RES-GUA-008', 'Mariana Castillo', 'Tikal y Flores', 'Petén', 'cultural', 600.00, 'confirmada', '2026-06-22'),
('RES-GUA-009', 'Gabriel Estrada', 'Fuentes Georginas', 'Quetzaltenango', 'montaña', 130.00, 'completada', '2026-06-25');
