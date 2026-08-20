USE campuslands_mysql;

INSERT INTO productos (
    nombre,
    categoria,
    precio,
    stock,
    estado
)
VALUES
    ('Hamburguesa Clasica', 'Hamburguesas', 28.00, 20, 'disponible'),
    ('Hamburguesa BBQ', 'Hamburguesas', 34.50, 15, 'disponible'),
    ('Hamburguesa Picante', 'Hamburguesas', 32.00, 8, 'disponible'),
    ('Pizza Personal', 'Pizzas', 25.00, 12, 'disponible'),
    ('Pizza Pepperoni', 'Pizzas', 31.50, 10, 'disponible'),
    ('Tacos de Pollo', 'Tacos', 22.00, 25, 'disponible'),
    ('Tacos al Pastor', 'Tacos', 24.00, 18, 'disponible'),
    ('Hot Dog Especial', 'Hot Dogs', 20.00, 14, 'disponible'),
    ('Papas Cargadas', 'Acompanamientos', 18.50, 30, 'disponible'),
    ('Alitas BBQ', 'Alitas', 36.00, 16, 'disponible');

INSERT INTO pedidos (
    cliente,
    estado
)
VALUES
    ('Carlos Mendoza', 'confirmado'),
    ('Laura Ramirez', 'confirmado');

INSERT INTO detalle_pedidos (
    id_pedido,
    id_producto,
    cantidad,
    precio_unitario
)
VALUES
    (1, 1, 2, 28.00),
    (1, 9, 1, 18.50),
    (2, 4, 1, 25.00),
    (2, 6, 2, 22.00);