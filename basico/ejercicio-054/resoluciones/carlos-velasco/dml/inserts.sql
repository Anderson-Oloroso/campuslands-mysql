USE campuslands_mysql;

INSERT INTO trabajos_soldadura
    (
        nombre_trabajo,
        tipo_soldadura,
        material,
        costo,
        estado,
        fecha_trabajo
    )
VALUES
    (
        'Estructura Metalica Bodega Norte',
        'MIG',
        'Acero',
        1850.00,
        'finalizado',
        '2026-08-01'
    ),
    (
        'Reparacion Puerta Industrial',
        'TIG',
        'Acero inoxidable',
        650.00,
        'finalizado',
        '2026-08-03'
    ),
    (
        'Soporte para Maquinaria',
        'Electrodo',
        'Acero',
        920.00,
        'en_proceso',
        '2026-08-05'
    ),
    (
        'Baranda Residencial',
        'MIG',
        'Hierro',
        780.00,
        'pendiente',
        '2026-08-07'
    ),
    (
        'Tanque de Almacenamiento',
        'TIG',
        'Acero inoxidable',
        2400.00,
        'finalizado',
        '2026-08-09'
    ),
    (
        'Marco Metalico Ventanal',
        'MIG',
        'Aluminio',
        560.00,
        'pendiente',
        '2026-08-11'
    ),
    (
        'Reparacion de Remolque',
        'Electrodo',
        'Acero',
        1150.00,
        'cancelado',
        '2026-08-12'
    ),
    (
        'Estructura para Escalera',
        'MIG',
        'Hierro',
        1320.00,
        'en_proceso',
        '2026-08-14'
    );