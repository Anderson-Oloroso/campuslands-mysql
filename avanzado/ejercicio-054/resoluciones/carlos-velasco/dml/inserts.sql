USE campuslands_mysql;

INSERT INTO ordenes_soldadura (
    cliente,
    tipo_soldadura,
    material,
    peso_kg,
    costo,
    estado,
    fecha_orden
) VALUES
('Metalicas Rivera', 'MIG', 'Acero', 125.50, 1850.00, 'en_proceso', '2026-08-01'),
('Estructuras Nova', 'TIG', 'Acero inoxidable', 82.30, 2140.00, 'pendiente', '2026-08-02'),
('Taller Industrial GT', 'Electrodo', 'Hierro', 210.75, 2950.00, 'en_proceso', '2026-08-03'),
('Construcciones Maya', 'MIG', 'Acero', 175.20, 2480.00, 'finalizada', '2026-08-04'),
('FerroTech', 'TIG', 'Aluminio', 64.80, 1980.00, 'pendiente', '2026-08-05'),
('Maquinaria Central', 'Electrodo', 'Acero', 320.40, 4250.00, 'en_proceso', '2026-08-06'),
('Industrias Quetzal', 'MIG', 'Acero inoxidable', 145.60, 3350.00, 'finalizada', '2026-08-07'),
('Taller El Progreso', 'TIG', 'Aluminio', 55.25, 1725.00, 'pendiente', '2026-08-08'),
('Estructuras del Sur', 'Electrodo', 'Hierro', 190.90, 2780.00, 'en_proceso', '2026-08-09'),
('Metal Works Guatemala', 'MIG', 'Acero', 275.30, 3890.00, 'finalizada', '2026-08-10');