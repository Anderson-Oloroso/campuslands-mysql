USE campuslands_mysql;

INSERT INTO trabajos_soldadura
    (nombre_trabajo, tipo_soldadura, material, costo, estado, fecha_trabajo)
VALUES
    ('Estructura Metalica A', 'MIG', 'Acero', 850.00, 'finalizado', '2026-01-10'),
    ('Reparacion de Tuberia', 'TIG', 'Acero inoxidable', 450.00, 'finalizado', '2026-01-15'),
    ('Puerta Industrial', 'MIG', 'Acero', 620.00, 'en_proceso', '2026-01-20'),
    ('Baranda Exterior', 'Electrodo', 'Hierro', 380.00, 'pendiente', '2026-02-05'),
    ('Soporte de Maquinaria', 'MIG', 'Acero', 720.00, 'finalizado', '2026-02-12'),
    ('Tanque de Almacenamiento', 'TIG', 'Acero inoxidable', 1250.00, 'en_proceso', '2026-02-20'),
    ('Reparacion de Reja', 'Electrodo', 'Hierro', 250.00, 'cancelado', '2026-03-01'),
    ('Marco Metalico', 'MIG', 'Acero', 500.00, 'pendiente', '2026-03-08'),
    ('Estructura para Techo', 'Electrodo', 'Acero', 950.00, 'finalizado', '2026-03-15'),
    ('Reparacion de Vehiculo', 'TIG', 'Aluminio', 680.00, 'en_proceso', '2026-03-22');