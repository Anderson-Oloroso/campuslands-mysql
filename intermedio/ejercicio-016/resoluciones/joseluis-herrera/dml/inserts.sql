USE campuslands_mysql;

INSERT INTO clientes
    (nombre, telefono, direccion)
VALUES
    ('Carlos Méndez', '5551-1001', 'Zona 1'),
    ('Ana López', '5551-1002', 'Zona 4'),
    ('Luis García', '5551-1003', 'Zona 7'),
    ('María Pérez', '5551-1004', 'Zona 10'),
    ('Sofía Ramírez', '5551-1005', 'Zona 12');

INSERT INTO platos
    (nombre, categoria, precio, disponible)
VALUES
    ('Hamburguesa Clásica', 'Hamburguesas', 18.50, TRUE),
    ('Hamburguesa BBQ', 'Hamburguesas', 24.00, TRUE),
    ('Hot Dog Especial', 'Hot Dogs', 15.00, TRUE),
    ('Papas con Cheddar', 'Acompañamientos', 12.50, TRUE),
    ('Alitas BBQ', 'Alitas', 28.00, TRUE),
    ('Tacos de Pollo', 'Tacos', 20.00, TRUE),
    ('Nachos Supremos', 'Acompañamientos', 22.00, FALSE),
    ('Combo Urbano', 'Combos', 35.00, TRUE);

INSERT INTO pedidos
    (id_cliente, fecha_pedido, estado)
VALUES
    (1, '2026-08-10 12:30:00', 'Entregado'),
    (2, '2026-08-10 13:15:00', 'Entregado'),
    (3, '2026-08-11 14:00:00', 'Pendiente'),
    (1, '2026-08-11 18:30:00', 'Entregado'),
    (4, '2026-08-12 19:00:00', 'En preparación'),
    (5, '2026-08-12 20:15:00', 'Entregado');

INSERT INTO detalle_pedido
    (id_pedido, id_plato, cantidad, precio_unitario)
VALUES
    (1, 1, 2, 18.50),
    (1, 4, 1, 12.50),
    (2, 2, 1, 24.00),
    (2, 3, 2, 15.00),
    (3, 5, 1, 28.00),
    (3, 6, 2, 20.00),
    (4, 8, 1, 35.00),
    (5, 7, 1, 22.00),
    (5, 4, 2, 12.50),
    (6, 1, 1, 18.50),
    (6, 5, 2, 28.00);