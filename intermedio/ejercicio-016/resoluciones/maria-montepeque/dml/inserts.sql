-- Datos de practica: clientes, menu y pedidos de un restaurante de comida urbana.
USE campuslands_mysql;

INSERT INTO clientes_intermedio (nombre, ciudad, telefono) VALUES
('Laura Gomez', 'Bogota', '3001112233'),
('Carlos Ruiz', 'Medellin', '3002223344'),
('Ana Torres', 'Cali', '3003334455'),
('Diego Perez', 'Bogota', '3004445566');

INSERT INTO platillos_intermedio (nombre, categoria, precio) VALUES
('Burger Clasica Urbana', 'hamburguesa', 32.50),
('Taco Callejero de Pastor', 'taco', 18.00),
('Limonada de Coco', 'bebida', 15.00),
('Brownie con Helado', 'postre', 20.00),
('Papas Urbanas con Queso', 'acompanamiento', 22.00);

INSERT INTO pedidos_intermedio (id_cliente, id_platillo, cantidad, estado) VALUES
(1, 1, 2, 'entregado'),
(1, 3, 1, 'entregado'),
(2, 2, 3, 'en_preparacion'),
(2, 5, 1, 'pendiente'),
(3, 1, 1, 'entregado'),
(3, 4, 2, 'entregado'),
(4, 2, 4, 'cancelado'),
(4, 3, 2, 'pendiente');
