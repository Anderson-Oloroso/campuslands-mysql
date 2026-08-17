-- DML: Registro de 8 diseños del catálogo de tatuajes
USE campuslands_mysql;

INSERT INTO catalogo_tatuajes (codigo_disenio, nombre_disenio, estilo, tamanio_cm, precio_estimado, disponible, fecha_registro) VALUES
('TAT-DIS-001', 'Jagger Panther', 'tradicional', '15x10', 180.00, TRUE, '2026-07-01'),
('TAT-DIS-002', 'Lobo Realista', 'realismo', '20x15', 350.00, TRUE, '2026-07-02'),
('TAT-DIS-003', 'Serpiente Floral', 'fine line', '12x8', 130.00, TRUE, '2026-07-03'),
('TAT-DIS-004', 'Daga Neotradicional', 'neotradicional', '18x10', 220.00, TRUE, '2026-07-05'),
('TAT-DIS-005', 'Cráneo Geométrico', 'blackwork', '14x12', 190.00, FALSE, '2026-07-08'),
('TAT-DIS-006', 'Retrato de Mascota', 'realismo', '15x15', 300.00, TRUE, '2026-07-10'),
('TAT-DIS-007', 'Catrina Ilustrada', 'neotradicional', '22x14', 280.00, TRUE, '2026-07-12'),
('TAT-DIS-008', 'Dragon Ball - Goku', 'anime', '10x10', 150.00, TRUE, '2026-07-15');
