USE campuslands_mysql;

INSERT INTO prendas (
    nombre,
    categoria,
    talla,
    precio,
    stock,
    disponible,
    fecha_ingreso,
    hora_actualizacion,
    descripcion
)
VALUES
    (
        'Camiseta Basica',
        'Camisetas',
        'M',
        45.00,
        25,
        TRUE,
        '2026-01-10',
        '2026-01-10 09:30:00',
        'Camiseta de algodon para uso diario'
    ),
    (
        'Camiseta Oversize',
        'Camisetas',
        'L',
        65.00,
        18,
        TRUE,
        '2026-01-15',
        '2026-01-15 10:00:00',
        'Camiseta amplia de estilo urbano'
    ),
    (
        'Jeans Clasicos',
        'Pantalones',
        '32',
        120.00,
        12,
        TRUE,
        '2026-02-01',
        '2026-02-01 11:15:00',
        'Jeans de corte clasico'
    ),
    (
        'Jeans Slim',
        'Pantalones',
        '30',
        135.00,
        8,
        TRUE,
        '2026-02-05',
        '2026-02-05 14:20:00',
        'Jeans de corte ajustado'
    ),
    (
        'Chaqueta Denim',
        'Chaquetas',
        'M',
        180.00,
        6,
        TRUE,
        '2026-02-12',
        '2026-02-12 16:00:00',
        'Chaqueta de mezclilla resistente'
    ),
    (
        'Chaqueta Impermeable',
        'Chaquetas',
        'L',
        220.00,
        4,
        TRUE,
        '2026-02-18',
        '2026-02-18 13:45:00',
        'Chaqueta ligera resistente al agua'
    ),
    (
        'Sudadera Urbana',
        'Sudaderas',
        'L',
        110.00,
        15,
        TRUE,
        '2026-03-01',
        '2026-03-01 09:00:00',
        'Sudadera con capucha para clima frio'
    ),
    (
        'Vestido Casual',
        'Vestidos',
        'S',
        95.00,
        9,
        TRUE,
        '2026-03-05',
        '2026-03-05 12:30:00',
        'Vestido ligero para uso casual'
    ),
    (
        'Gorra Clasica',
        'Accesorios',
        'U',
        35.00,
        30,
        TRUE,
        '2026-03-10',
        '2026-03-10 15:10:00',
        'Gorra ajustable de estilo clasico'
    ),
    (
        'Bufanda de Lana',
        'Accesorios',
        'U',
        55.00,
        0,
        FALSE,
        '2026-03-15',
        '2026-03-15 17:20:00',
        'Bufanda de lana para clima frio'
    );