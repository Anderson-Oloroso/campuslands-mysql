USE campuslands_mysql;

INSERT INTO motos
    (marca, modelo, cilindrada, anio, estado)
VALUES
    ('Yamaha', 'MT-07', 689, 2024, 'activa'),
    ('Honda', 'CB500F', 471, 2023, 'activa'),
    ('Kawasaki', 'Ninja 650', 649, 2024, 'mantenimiento'),
    ('Suzuki', 'GSX-8R', 776, 2024, 'activa'),
    ('Ducati', 'Monster', 937, 2023, 'mantenimiento'),
    ('KTM', 'Duke 390', 373, 2022, 'activa'),
    ('BMW', 'G 310 R', 313, 2023, 'activa'),
    ('Yamaha', 'R7', 689, 2022, 'inactiva'),
    ('Honda', 'CBR650R', 649, 2024, 'activa'),
    ('Kawasaki', 'Z900', 948, 2023, 'mantenimiento');

INSERT INTO servicios
    (id_moto, tipo_servicio, costo, fecha_servicio, estado)
VALUES
    (1, 'Cambio de aceite', 85.00, '2026-01-15', 'completado'),
    (1, 'Revision de frenos', 120.00, '2026-03-10', 'completado'),
    (2, 'Cambio de aceite', 75.00, '2026-02-05', 'completado'),
    (2, 'Cambio de llantas', 280.00, '2026-05-18', 'completado'),
    (3, 'Ajuste de cadena', 65.00, '2026-01-28', 'completado'),
    (3, 'Revision general', 190.00, '2026-04-12', 'pendiente'),
    (4, 'Cambio de aceite', 95.00, '2026-02-20', 'completado'),
    (4, 'Revision de suspension', 210.00, '2026-06-14', 'completado'),
    (5, 'Servicio completo', 450.00, '2026-01-30', 'completado'),
    (5, 'Cambio de frenos', 320.00, '2026-05-22', 'pendiente'),
    (6, 'Cambio de aceite', 70.00, '2026-03-02', 'completado'),
    (7, 'Revision electrica', 110.00, '2026-04-08', 'completado'),
    (8, 'Cambio de llantas', 300.00, '2026-02-16', 'completado'),
    (9, 'Mantenimiento preventivo', 175.00, '2026-06-01', 'completado'),
    (10, 'Servicio completo', 390.00, '2026-06-20', 'pendiente');