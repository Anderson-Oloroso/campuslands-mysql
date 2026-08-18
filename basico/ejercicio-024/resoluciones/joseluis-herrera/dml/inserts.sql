USE campuslands_mysql;

INSERT INTO trabajos_soldadura
    (nombre_trabajo, tipo_soldadura, material, costo, estado)
VALUES
    ('Estructura Metalica A', 'MIG', 'Acero', 850.00, 'finalizado'),
    ('Reparacion de Tuberia', 'TIG', 'Acero inoxidable', 450.00, 'finalizado'),
    ('Puerta Industrial', 'MIG', 'Acero', 620.00, 'en_proceso'),
    ('Baranda Exterior', 'Electrodo', 'Hierro', 380.00, 'pendiente'),
    ('Soporte de Maquinaria', 'MIG', 'Acero', 720.00, 'finalizado'),
    ('Tanque de Almacenamiento', 'TIG', 'Acero inoxidable', 1250.00, 'en_proceso'),
    ('Reparacion de Reja', 'Electrodo', 'Hierro', 250.00, 'cancelado'),
    ('Marco Metalico', 'MIG', 'Acero', 500.00, 'pendiente'),
    ('Estructura para Techo', 'Electrodo', 'Acero', 950.00, 'finalizado'),
    ('Reparacion de Vehiculo', 'TIG', 'Aluminio', 680.00, 'cancelado');