USE campuslands_mysql;

INSERT INTO clientes (
    nombre,
    telefono,
    estado
) VALUES
    ('Carlos Mendoza', '55510001', 'activo'),
    ('Laura Castillo', '55510002', 'activo'),
    ('Diego Ramirez', '55510003', 'activo'),
    ('Sofia Herrera', '55510004', 'activo'),
    ('Mateo Lopez', '55510005', 'inactivo'),
    ('Valeria Cruz', '55510006', 'activo');


INSERT INTO tatuadores (
    nombre,
    especialidad,
    tarifa_hora
) VALUES
    ('Alejandro Ruiz', 'Realismo', 450.00),
    ('Camila Torres', 'Minimalista', 300.00),
    ('Bruno Morales', 'Tradicional', 350.00),
    ('Daniela Perez', 'Blackwork', 400.00);


INSERT INTO citas (
    id_cliente,
    id_tatuador,
    fecha_cita,
    horas_estimadas,
    precio,
    estado
) VALUES
    (1, 1, '2026-08-20', 4.00, 1800.00, 'realizada'),
    (2, 2, '2026-08-21', 2.00, 600.00, 'programada'),
    (3, 3, '2026-08-22', 3.00, 1050.00, 'realizada'),
    (4, 4, '2026-08-23', 5.00, 2000.00, 'programada'),
    (1, 2, '2026-08-25', 3.00, 900.00, 'programada'),
    (6, 1, '2026-08-26', 2.00, 900.00, 'cancelada');