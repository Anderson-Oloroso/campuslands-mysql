USE campuslands_mysql;

INSERT INTO soldadores (
    nombre,
    especialidad,
    experiencia_anios,
    estado
) VALUES
    ('Carlos Mendoza', 'Soldadura MIG', 6, 'activo'),
    ('Ana Torres', 'Soldadura TIG', 8, 'activo'),
    ('Luis Herrera', 'Soldadura de estructuras', 5, 'activo'),
    ('Mariana Lopez', 'Soldadura de aluminio', 3, 'inactivo');

INSERT INTO trabajos_soldadura (
    soldador_id,
    tipo_trabajo,
    material,
    fecha_trabajo,
    costo,
    estado
) VALUES
    (1, 'Reparacion de estructura', 'Acero', '2026-08-01', 450.00, 'finalizado'),
    (1, 'Fabricacion de soporte', 'Acero inoxidable', '2026-08-04', 320.00, 'finalizado'),
    (2, 'Reparacion de tuberia', 'Acero inoxidable', '2026-08-05', 580.00, 'en_proceso'),
    (2, 'Soldadura de precision', 'Aluminio', '2026-08-07', 690.00, 'finalizado'),
    (3, 'Fabricacion de marco', 'Acero', '2026-08-08', 760.00, 'en_proceso'),
    (3, 'Reparacion de maquinaria', 'Acero', '2026-08-10', 520.00, 'pendiente'),
    (4, 'Reparacion de pieza', 'Aluminio', '2026-08-11', 280.00, 'finalizado'),
    (1, 'Fabricacion de soporte', 'Acero', '2026-08-12', 410.00, 'pendiente');