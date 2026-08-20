USE campuslands_mysql;

INSERT INTO productos (
    nombre,
    categoria,
    precio,
    stock,
    estado,
    ultima_actualizacion
) VALUES
(
    'Auriculares Bluetooth Pro',
    'Audio',
    249.99,
    18,
    'activo',
    '2026-08-15 10:30:00'
),
(
    'Teclado Mecanico RGB',
    'Perifericos',
    389.50,
    12,
    'activo',
    '2026-08-14 14:20:00'
),
(
    'Mouse Gamer Inalambrico',
    'Perifericos',
    179.90,
    25,
    'activo',
    '2026-08-12 09:15:00'
),
(
    'Smartwatch Fit X',
    'Wearables',
    529.00,
    8,
    'activo',
    '2026-07-01 16:40:00'
),
(
    'Cargador USB-C 65W',
    'Accesorios',
    149.99,
    30,
    'activo',
    '2026-06-20 11:00:00'
),
(
    'Soporte Ergonomico Laptop',
    'Oficina',
    219.00,
    14,
    'activo',
    '2026-08-10 13:30:00'
),
(
    'Hub USB-C 7 Puertos',
    'Conectividad',
    299.90,
    6,
    'activo',
    '2026-07-10 08:45:00'
),
(
    'Camara Web Full HD',
    'Video',
    329.50,
    10,
    'inactivo',
    '2026-05-25 15:10:00'
);

INSERT INTO movimientos_inventario (
    id_producto,
    tipo_movimiento,
    cantidad,
    fecha_movimiento
) VALUES
(1, 'entrada', 20, '2026-08-15 10:30:00'),
(1, 'salida', 2, '2026-08-16 12:10:00'),

(2, 'entrada', 15, '2026-08-14 14:20:00'),
(2, 'salida', 3, '2026-08-15 09:40:00'),

(3, 'entrada', 30, '2026-08-12 09:15:00'),
(3, 'salida', 5, '2026-08-13 17:20:00'),

(4, 'entrada', 10, '2026-07-01 16:40:00'),

(5, 'entrada', 35, '2026-06-20 11:00:00'),
(5, 'salida', 5, '2026-06-25 10:30:00'),

(6, 'entrada', 18, '2026-08-10 13:30:00'),
(6, 'salida', 4, '2026-08-11 11:45:00'),

(7, 'entrada', 8, '2026-07-10 08:45:00'),

(8, 'entrada', 12, '2026-05-25 15:10:00');