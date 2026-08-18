-- Datos de practica para restaurante de comida urbana (INNER JOIN).
USE campuslands_mysql;

INSERT INTO intermedio_ejercicio_016_platos (nombre, categoria, precio) 
    VALUES ('Smash Burger Doble', 'Hamburguesas', 8.50),
    ('Classic Hot Dog', 'Hot Dogs', 4.00),
    ('Papas Fritas con Queso', 'Acompañamientos', 5.50),
    ('Refresco de Cola', 'Bebidas', 2.00),
    ('Milkshake de Vainilla', 'Postres', 4.50),
    ('Veggie Burger', 'Hamburguesas', 7.50);

INSERT INTO intermedio_ejercicio_016_pedidos (cliente, numero_mesa, fecha_pedido) 
    VALUES ('Carlos Mendoza', 4, '2026-08-20 19:30:00'),
    ('Ana Suarez', 2, '2026-08-20 19:45:00'),
    ('Jorge Perez', 6, '2026-08-20 20:15:00'),
    ('Lucia Gomez', 1, '2026-08-20 20:30:00');

INSERT INTO intermedio_ejercicio_016_pedido_detalles (pedido_id, plato_id, cantidad, precio_unitario) 
    VALUES -- Pedido 1 (Carlos: 1 Smash Burger, 1 Papas, 1 Refresco)
    (1, 1, 1, 8.50),
    (1, 3, 1, 5.50),
    (1, 4, 1, 2.00),
        -- Pedido 2 (Ana: 1 Veggie Burger, 1 Refresco)
    (2, 6, 1, 7.50),
    (2, 4, 1, 2.00),
        -- Pedido 3 (Jorge: 2 Hot Dogs, 1 Papas, 2 Milkshakes)
    (3, 2, 2, 4.00),
    (3, 3, 1, 5.50),
    (3, 5, 2, 4.50),
        -- Pedido 4 (Lucia: 1 Smash Burger, 1 Milkshake)
    (4, 1, 1, 8.50),
    (4, 5, 1, 4.50);