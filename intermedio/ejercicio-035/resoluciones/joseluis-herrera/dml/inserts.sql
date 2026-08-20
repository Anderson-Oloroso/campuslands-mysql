USE campuslands_mysql;

INSERT INTO servicios_taller (
    placa,
    marca,
    modelo,
    tipo_servicio,
    estado,
    fecha_servicio,
    costo
) VALUES
    ('MTO101', 'Yamaha', 'MT-07', 'mantenimiento', 'finalizado', '2026-07-01', 850.00),
    ('MTO102', 'Honda', 'CB500F', 'cambio de aceite', 'finalizado', '2026-07-03', 320.00),
    ('MTO103', 'Suzuki', 'Gixxer 250', 'frenos', 'en proceso', '2026-07-05', 650.00),
    ('MTO104', 'Kawasaki', 'Ninja 400', 'motor', 'pendiente', '2026-07-08', 1800.00),
    ('MTO105', 'Honda', 'XR190L', 'suspension', 'finalizado', '2026-07-10', 950.00),
    ('MTO106', 'Yamaha', 'R3', 'electricidad', 'en proceso', '2026-07-12', 720.00),
    ('MTO107', 'Suzuki', 'GSX-S750', 'mantenimiento', 'finalizado', '2026-07-15', 1100.00),
    ('MTO108', 'Kawasaki', 'Z400', 'frenos', 'pendiente', '2026-07-18', 580.00),
    ('MTO109', 'Honda', 'CB190R', 'cambio de aceite', 'finalizado', '2026-07-20', 300.00),
    ('MTO110', 'Yamaha', 'XMAX 300', 'electricidad', 'en proceso', '2026-07-22', 780.00),
    ('MTO111', 'Honda', 'CB650R', 'mantenimiento', 'finalizado', '2026-07-24', 1250.00),
    ('MTO112', 'Kawasaki', 'Versys 650', 'suspension', 'finalizado', '2026-07-26', 1050.00);