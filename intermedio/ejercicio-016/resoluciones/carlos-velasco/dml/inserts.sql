USE campuslands_mysql;


-- ============================================================
-- CLIENTES
-- ============================================================

INSERT INTO clientes (
    nombre,
    telefono,
    estado
) VALUES
    ('Carlos Mendoza', '55510001', 'activo'),
    ('Laura Ramirez', '55510002', 'activo'),
    ('Diego Herrera', '55510003', 'activo'),
    ('Sofia Castillo', '55510004', 'activo'),
    ('Mateo Gonzalez', '55510005', 'activo'),
    ('Valentina Cruz', '55510006', 'activo'),
    ('Andres Morales', '55510007', 'inactivo'),
    ('Camila Torres', '55510008', 'activo');


-- ============================================================
-- PLATOS
-- ============================================================

INSERT INTO platos (
    nombre,
    categoria,
    precio,
    disponible
) VALUES
    ('Hamburguesa Clasica', 'Hamburguesas', 28.50, TRUE),
    ('Hamburguesa BBQ', 'Hamburguesas', 34.00, TRUE),
    ('Perro Especial', 'Hot Dogs', 22.00, TRUE),
    ('Perro Mexicano', 'Hot Dogs', 25.50, TRUE),
    ('Papas Cheddar', 'Acompanamientos', 18.00, TRUE),
    ('Alitas Picantes', 'Alitas', 32.00, TRUE),
    ('Nachos Mixtos', 'Acompanamientos', 27.50, TRUE),
    ('Tacos Urbanos', 'Tacos', 30.00, TRUE),
    ('Combo Familiar', 'Combos', 65.00, TRUE),
    ('Brownie con Helado', 'Postres', 20.00, FALSE);


-- ============================================================
-- PEDIDOS
-- ============================================================

INSERT INTO pedidos (
    id_cliente,
    id_plato,
    cantidad,
    fecha_pedido,
    estado
) VALUES
    (1, 1, 2, '2026-08-10 12:30:00', 'entregado'),
    (2, 2, 1, '2026-08-10 13:15:00', 'entregado'),
    (3, 3, 2, '2026-08-11 14:00:00', 'entregado'),
    (4, 6, 1, '2026-08-11 19:20:00', 'entregado'),
    (5, 9, 1, '2026-08-12 18:30:00', 'preparando'),
    (6, 8, 3, '2026-08-12 19:10:00', 'entregado'),
    (1, 5, 2, '2026-08-13 12:45:00', 'entregado'),
    (2, 7, 1, '2026-08-13 13:20:00', 'pendiente'),
    (3, 4, 2, '2026-08-14 18:00:00', 'entregado'),
    (4, 1, 1, '2026-08-14 19:15:00', 'preparando'),
    (6, 9, 2, '2026-08-15 20:00:00', 'pendiente'),
    (7, 10, 1, '2026-08-15 20:30:00', 'cancelado');