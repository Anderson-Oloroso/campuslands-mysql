USE campuslands_mysql;


INSERT INTO clientes
    (nombre, telefono, correo)
VALUES
    ('Constructora Metalica GT', '5551-2001', 'contacto@metalica.gt'),
    ('Industrias del Pacifico', '5551-2002', 'proyectos@pacifico.gt'),
    ('Talleres El Progreso', '5551-2003', 'info@progreso.gt'),
    ('Estructuras Modernas', '5551-2004', 'contacto@estructuras.gt');


INSERT INTO soldadores
    (nombre, especialidad, experiencia_anios)
VALUES
    ('Carlos Ramirez', 'Soldadura MIG', 8),
    ('Ana Lopez', 'Soldadura TIG', 6),
    ('Miguel Hernandez', 'Soldadura por electrodo', 10),
    ('Sofia Martinez', 'Soldadura de aluminio', 5);


INSERT INTO trabajos_soldadura
    (nombre_trabajo, tipo_soldadura, material, costo, estado, fecha_trabajo, cliente_id, soldador_id)
VALUES
    ('Estructura Metalica A', 'MIG', 'Acero', 850.00, 'finalizado', '2026-01-10', 1, 1),
    ('Reparacion de Tuberia', 'TIG', 'Acero inoxidable', 450.00, 'finalizado', '2026-01-15', 2, 2),
    ('Puerta Industrial', 'MIG', 'Acero', 620.00, 'en_proceso', '2026-01-20', 3, 1),
    ('Baranda Exterior', 'Electrodo', 'Hierro', 380.00, 'pendiente', '2026-02-05', 4, 3),
    ('Soporte de Maquinaria', 'MIG', 'Acero', 720.00, 'finalizado', '2026-02-12', 1, 1),
    ('Tanque de Almacenamiento', 'TIG', 'Acero inoxidable', 1250.00, 'en_proceso', '2026-02-20', 2, 2),
    ('Reparacion de Reja', 'Electrodo', 'Hierro', 250.00, 'cancelado', '2026-03-01', 3, 3),
    ('Marco Metalico', 'MIG', 'Acero', 500.00, 'pendiente', '2026-03-08', 4, 1),
    ('Estructura para Techo', 'Electrodo', 'Acero', 950.00, 'finalizado', '2026-03-15', 1, 3),
    ('Reparacion de Vehiculo', 'TIG', 'Aluminio', 680.00, 'en_proceso', '2026-03-22', 2, 4);