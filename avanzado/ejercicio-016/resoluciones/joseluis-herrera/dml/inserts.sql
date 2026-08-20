USE campuslands_mysql;

START TRANSACTION;

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

INSERT INTO inventario
    (id_plato, stock)
VALUES
    (1, 20),
    (2, 15),
    (3, 25),
    (4, 30),
    (5, 12),
    (6, 18),
    (7, 10),
    (8, 8);

COMMIT;


START TRANSACTION;

INSERT INTO pedidos
    (id_cliente, fecha_pedido, estado)
VALUES
    (1, '2026-08-17 18:00:00', 'Pendiente');

INSERT INTO detalle_pedido
    (id_pedido, id_plato, cantidad, precio_unitario)
VALUES
    (LAST_INSERT_ID(), 1, 2, 18.50),
    (LAST_INSERT_ID(), 4, 1, 12.50);

UPDATE inventario
SET
    stock = stock - 2,
    ultima_actualizacion = CURRENT_TIMESTAMP
WHERE id_plato = 1
  AND stock >= 2;

UPDATE inventario
SET
    stock = stock - 1,
    ultima_actualizacion = CURRENT_TIMESTAMP
WHERE id_plato = 4
  AND stock >= 1;

COMMIT;


START TRANSACTION;

UPDATE inventario
SET
    stock = stock - 5,
    ultima_actualizacion = CURRENT_TIMESTAMP
WHERE id_plato = 2
  AND stock >= 5;

ROLLBACK;