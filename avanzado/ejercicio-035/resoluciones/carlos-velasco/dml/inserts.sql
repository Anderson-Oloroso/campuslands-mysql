USE campuslands_mysql;

INSERT INTO servicios_mecanicos (
    placa,
    marca,
    modelo,
    tipo_servicio,
    fecha_ingreso,
    fecha_salida,
    estado,
    costo
) VALUES
    ('MTA101', 'Yamaha', 'FZ 25', 'Cambio de aceite', '2026-07-01', '2026-07-01', 'finalizado', 85000.00),
    ('MTB202', 'Honda', 'CB 190R', 'Revision de frenos', '2026-07-02', '2026-07-03', 'finalizado', 145000.00),
    ('MTC303', 'Suzuki', 'Gixxer 250', 'Mantenimiento general', '2026-07-04', NULL, 'en_proceso', 320000.00),
    ('MTD404', 'Kawasaki', 'Ninja 400', 'Cambio de kit de arrastre', '2026-07-05', '2026-07-06', 'finalizado', 480000.00),
    ('MTE505', 'Bajaj', 'Pulsar NS200', 'Cambio de llantas', '2026-07-07', NULL, 'pendiente', 620000.00),
    ('MTF606', 'Yamaha', 'MT-03', 'Revision electrica', '2026-07-08', '2026-07-09', 'finalizado', 210000.00),
    ('MTG707', 'Honda', 'XR 150L', 'Cambio de aceite', '2026-07-10', NULL, 'en_proceso', 90000.00),
    ('MTH808', 'Suzuki', 'DR 650', 'Mantenimiento general', '2026-07-11', NULL, 'pendiente', 350000.00),
    ('MTI909', 'KTM', 'Duke 390', 'Revision de frenos', '2026-07-12', '2026-07-13', 'finalizado', 175000.00),
    ('MTJ010', 'Bajaj', 'Dominar 400', 'Cambio de bateria', '2026-07-14', NULL, 'en_proceso', 280000.00);