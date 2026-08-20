-- Datos de practica. Puedes cambiarlos o agregar mas filas.
USE campuslands_mysql;

INSERT INTO clientes_restaurante (nombre, telefono) VALUES
('Diego Fuentes', '5555-1001'),
('Karla Solis', '5555-1002'),
('Pablo Ordonez', '5555-1003'),
('Renata Aguilar', '5555-1004'),
('Hugo Marroquin', '5555-1005');

INSERT INTO pedidos_restaurante (cliente_id, platillo, precio, fecha_pedido) VALUES
(1, 'Taco Callejero x3', 45.00, '2025-03-01'),
(1, 'Burger Urbana', 62.50, '2025-03-03'),
(2, 'Papas Loaded', 38.00, '2025-03-01'),
(2, 'Hot Dog Especial', 30.00, '2025-03-04'),
(3, 'Burger Urbana', 62.50, '2025-03-02'),
(3, 'Taco Callejero x3', 45.00, '2025-03-05'),
(3, 'Limonada Grande', 15.00, '2025-03-05'),
(4, 'Papas Loaded', 38.00, '2025-03-02'),
(4, 'Hot Dog Especial', 30.00, '2025-03-06'),
(5, 'Burger Urbana', 62.50, '2025-03-03');
