USE campuslands_mysql;

INSERT INTO motos
    (placa, marca, modelo, cilindrada, kilometraje, estado)
VALUES
    ('MOT001', 'Yamaha', 'MT-07', 689, 12500, 'disponible'),
    ('MOT002', 'Honda', 'CB650R', 649, 18300, 'disponible'),
    ('MOT003', 'Kawasaki', 'Ninja 400', 399, 9700, 'mantenimiento'),
    ('MOT004', 'Suzuki', 'GSX-S750', 749, 22100, 'disponible'),
    ('MOT005', 'Ducati', 'Monster 937', 937, 8600, 'disponible'),
    ('MOT006', 'BMW', 'G 310 R', 313, 15400, 'fuera_servicio'),
    ('MOT007', 'KTM', 'Duke 390', 373, 11200, 'disponible'),
    ('MOT008', 'Royal Enfield', 'Interceptor 650', 648, 19800, 'mantenimiento');


INSERT INTO mantenimientos
    (id_moto, tipo_mantenimiento, costo, fecha_mantenimiento, kilometraje)
VALUES
    (1, 'Cambio de aceite', 85.00, '2026-08-01', 12500),
    (2, 'Revision de frenos', 145.50, '2026-08-02', 18300),
    (3, 'Cambio de cadena', 210.00, '2026-08-03', 9700),
    (4, 'Cambio de aceite', 90.00, '2026-08-04', 22100),
    (5, 'Revision general', 320.75, '2026-08-05', 8600),
    (6, 'Diagnostico electrico', 175.00, '2026-08-06', 15400),
    (7, 'Cambio de pastillas', 130.00, '2026-08-07', 11200),
    (8, 'Cambio de aceite', 95.00, '2026-08-08', 19800);