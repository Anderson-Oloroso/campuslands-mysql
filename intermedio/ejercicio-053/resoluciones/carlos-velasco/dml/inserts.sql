USE campuslands_mysql;


INSERT INTO clientes
    (nombre_cliente, telefono, correo)
VALUES
    ('Constructora Horizonte', '5551-1001', 'contacto@horizonte.com'),
    ('Grupo Urbano Maya', '5551-1002', 'proyectos@urbanomaya.com'),
    ('Inversiones Aurora', '5551-1003', 'info@aurorainversiones.com'),
    ('Desarrollos del Valle', '5551-1004', 'contacto@desarrollosvalle.com'),
    ('Arquitectura Central', '5551-1005', 'proyectos@arquitecturacentral.com');


INSERT INTO arquitectos
    (nombre_arquitecto, especialidad)
VALUES
    ('Laura Méndez', 'Arquitectura residencial'),
    ('Carlos Ramírez', 'Arquitectura comercial'),
    ('Sofía Herrera', 'Visualización arquitectónica'),
    ('Diego Morales', 'Diseño urbano');


INSERT INTO software_3d
    (nombre_software, fabricante)
VALUES
    ('Blender', 'Blender Foundation'),
    ('3ds Max', 'Autodesk'),
    ('SketchUp', 'Trimble'),
    ('Revit', 'Autodesk');


INSERT INTO tipos_proyecto
    (nombre_tipo, descripcion)
VALUES
    ('Residencial', 'Diseño y visualización de viviendas'),
    ('Comercial', 'Diseño de espacios comerciales'),
    ('Cultural', 'Diseño de espacios culturales'),
    ('Urbano', 'Diseño y planificación de espacios urbanos');


INSERT INTO proyectos
    (
        nombre_proyecto,
        id_cliente,
        id_arquitecto,
        id_software,
        id_tipo_proyecto,
        presupuesto,
        estado,
        fecha_entrega
    )
VALUES
    (
        'Residencia Moderna Zona 10',
        1, 1, 1, 1,
        18500.00,
        'en_revision',
        '2026-09-15'
    ),
    (
        'Torre Empresarial Central',
        2, 2, 2, 2,
        42000.00,
        'aprobado',
        '2026-10-20'
    ),
    (
        'Casa Minimalista Vista Verde',
        3, 1, 3, 1,
        12750.00,
        'planificado',
        '2026-09-30'
    ),
    (
        'Centro Cultural Aurora',
        3, 3, 1, 3,
        31500.00,
        'en_revision',
        '2026-11-10'
    ),
    (
        'Complejo Deportivo Norte',
        4, 4, 4, 4,
        56000.00,
        'aprobado',
        '2026-12-05'
    ),
    (
        'Apartamento Urbano 3D',
        1, 3, 3, 1,
        9800.00,
        'planificado',
        '2026-08-30'
    ),
    (
        'Hotel Boutique Colonial',
        5, 2, 2, 2,
        38500.00,
        'en_revision',
        '2026-10-05'
    ),
    (
        'Museo Interactivo Futuro',
        2, 3, 1, 3,
        47500.00,
        'finalizado',
        '2026-07-25'
    );