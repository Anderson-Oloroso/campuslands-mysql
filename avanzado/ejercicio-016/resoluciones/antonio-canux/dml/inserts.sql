USE campuslands_mysql;

INSERT INTO avanzado_ejercicio_016_clientes (nombre, billetera_digital) 
    VALUES ('Carlos Mendoza', 50.00),
    ('Ana Suarez', 10.00),
    ('Jorge Perez', 100.00);

INSERT INTO avanzado_ejercicio_016_pedidos (cliente_id, descripcion_pedido, total_pagar) 
    VALUES (1, 'Combo Smash Burger + Malteada', 15.50),
    (2, 'Classic Hot Dog + Papas', 12.00),
    (3, 'Bandeja Urbana Familiar', 45.00);