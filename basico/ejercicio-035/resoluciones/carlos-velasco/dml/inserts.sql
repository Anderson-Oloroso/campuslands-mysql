USE campuslands_mysql;

INSERT INTO servicios_mecanicos (
    cliente,
    marca_moto,
    modelo_moto,
    tipo_servicio,
    costo,
    fecha_servicio,
    estado
) VALUES
    ('Carlos Mendoza', 'Yamaha', 'MT-07', 'Cambio de aceite', 85.00, '2026-08-01', 'finalizado'),
    ('Ana Lopez', 'Honda', 'CB650R', 'Revision de frenos', 140.00, '2026-08-03', 'finalizado'),
    ('Luis Ramirez', 'Kawasaki', 'Ninja 400', 'Cambio de cadena', 220.00, '2026-08-05', 'en_proceso'),
    ('Sofia Castillo', 'Suzuki', 'GSX-8R', 'Mantenimiento general', 310.00, '2026-08-06', 'pendiente'),
    ('Diego Morales', 'KTM', 'Duke 390', 'Cambio de llantas', 280.00, '2026-08-07', 'finalizado'),
    ('Valeria Perez', 'Ducati', 'Monster', 'Revision de motor', 450.00, '2026-08-09', 'en_proceso'),
    ('Miguel Torres', 'BMW', 'G 310 R', 'Cambio de aceite', 90.00, '2026-08-10', 'finalizado'),
    ('Laura Gomez', 'Royal Enfield', 'Interceptor 650', 'Ajuste de suspension', 175.00, '2026-08-11', 'pendiente'),
    ('Jorge Herrera', 'Yamaha', 'R7', 'Revision de frenos', 150.00, '2026-08-13', 'en_proceso'),
    ('Daniela Ruiz', 'Honda', 'CB500F', 'Mantenimiento general', 295.00, '2026-08-15', 'finalizado');