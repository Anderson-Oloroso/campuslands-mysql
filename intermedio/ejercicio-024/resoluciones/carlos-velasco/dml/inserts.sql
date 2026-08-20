USE campuslands_mysql;

INSERT INTO soldadores (
    nombre_completo,
    especialidad,
    nivel_experiencia,
    estado
) VALUES
    ('Carlos Ramírez', 'Soldadura MIG', 'avanzado', 'activo'),
    ('Laura Gómez', 'Soldadura TIG', 'avanzado', 'activo'),
    ('Andrés López', 'Soldadura por arco', 'intermedio', 'activo'),
    ('Sofía Martínez', 'Soldadura MIG', 'intermedio', 'activo'),
    ('Daniel Hernández', 'Soldadura TIG', 'principiante', 'inactivo');


INSERT INTO trabajos_soldadura (
    id_soldador,
    tipo_soldadura,
    material,
    descripcion,
    costo,
    fecha_trabajo,
    estado
) VALUES
    (1, 'MIG', 'Acero', 'Fabricación de estructura metálica', 850.00, '2026-08-18', 'finalizado'),
    (1, 'MIG', 'Acero inoxidable', 'Reparación de marco industrial', 620.00, '2026-08-20', 'en_proceso'),
    (2, 'TIG', 'Aluminio', 'Reparación de piezas de aluminio', 480.00, '2026-08-21', 'finalizado'),
    (2, 'TIG', 'Acero inoxidable', 'Fabricación de tubería', 950.00, '2026-08-24', 'pendiente'),
    (3, 'Arco', 'Acero', 'Reparación de soporte metálico', 350.00, '2026-08-19', 'finalizado'),
    (3, 'Arco', 'Hierro', 'Soldadura de estructura pesada', 720.00, '2026-08-27', 'en_proceso'),
    (4, 'MIG', 'Acero', 'Fabricación de puerta metálica', 550.00, '2026-08-22', 'pendiente'),
    (4, 'MIG', 'Hierro', 'Reparación de baranda', 300.00, '2026-08-25', 'finalizado'),
    (1, 'MIG', 'Acero', 'Mantenimiento de estructura industrial', 1100.00, '2026-08-29', 'pendiente'),
    (2, 'TIG', 'Aluminio', 'Fabricación de componente especializado', 780.00, '2026-08-30', 'en_proceso');