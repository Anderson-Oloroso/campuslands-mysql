USE campuslands_mysql;

INSERT INTO clientes (
    nombre,
    correo,
    ciudad,
    estado
) VALUES
    ('Carlos Ramírez', 'carlos.ramirez@example.com', 'Guatemala', 'activo'),
    ('Laura Gómez', 'laura.gomez@example.com', 'Mixco', 'activo'),
    ('Andrés López', 'andres.lopez@example.com', 'Villa Nueva', 'activo'),
    ('Sofía Martínez', 'sofia.martinez@example.com', 'Guatemala', 'activo'),
    ('María Pérez', 'maria.perez@example.com', 'Antigua Guatemala', 'activo'),
    ('Daniel Hernández', 'daniel.hernandez@example.com', 'Escuintla', 'inactivo'),
    ('Valeria Castillo', 'valeria.castillo@example.com', 'Quetzaltenango', 'activo'),
    ('Jorge Morales', 'jorge.morales@example.com', 'Guatemala', 'activo');


INSERT INTO pedidos (
    id_cliente,
    fecha_pedido,
    total,
    estado
) VALUES
    (1, '2026-04-02', 185.50, 'pagado'),
    (1, '2026-04-18', 320.00, 'enviado'),
    (2, '2026-04-10', 145.75, 'pendiente'),
    (3, '2026-04-05', 210.00, 'pagado'),
    (3, '2026-05-02', 95.50, 'enviado'),
    (5, '2026-05-08', 450.00, 'pagado'),
    (6, '2026-05-12', 175.25, 'cancelado'),
    (7, '2026-05-20', 280.00, 'enviado'),
    (8, '2026-06-01', 125.00, 'pendiente'),
    (8, '2026-06-15', 390.75, 'pagado');