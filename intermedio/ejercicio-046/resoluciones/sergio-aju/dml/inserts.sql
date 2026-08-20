USE campuslands_mysql;

-- Categorías de comida urbana
INSERT INTO categorias (nombre, descripcion) VALUES
('Hamburguesas Smash', 'Burgers con carne smashed y queso fundido'),
('Tacos Urbanos', 'Tacos artesanales estilo callejero con tortillas recién hechas'),
('Acompañamientos', 'Papas fritas con toppings, aros de cebolla y nachos'),
('Bebidas y Malteadas', 'Refrescos, cervezas artesanales y malteadas');

-- Platillos
INSERT INTO platillos (categoria_id, nombre, precio, disponible) VALUES
(1, 'Smash Double Bacon Cheese', 65.00, TRUE),
(1, 'Smash Truffle Mushroom', 75.00, TRUE),
(2, 'Tacos de Birria con Consomé', 55.00, TRUE),
(2, 'Tacos de Pulled Pork BBQ', 50.00, TRUE),
(3, 'Papas Bacon & Cheddar Fries', 35.00, TRUE),
(3, 'Aros de Cebolla Crunch', 30.00, TRUE),
(4, 'Malteada de Nutella & Oreo', 40.00, TRUE),
(4, 'Cerveza IPA Artesanal', 38.00, TRUE);

-- Pedidos
INSERT INTO pedidos (numero_mesa, cliente_nombre, fecha_hora, estado) VALUES
(1, 'Carlos Mendoza', '2026-08-18 13:15:00', 'pagado'),
(4, 'Valeria Silva', '2026-08-18 13:40:00', 'pagado'),
(2, 'Diego Arriola', '2026-08-18 14:05:00', 'servido'),
(5, 'Sofía Ramírez', '2026-08-18 14:30:00', 'en_preparacion');

-- Detalle de pedidos
INSERT INTO detalle_pedidos (pedido_id, platillo_id, cantidad, precio_unitario) VALUES
(1, 1, 2, 65.00), -- 2 Smash Double Bacon
(1, 5, 1, 35.00), -- 1 Papas Bacon Cheddar
(1, 4, 2, 38.00), -- 2 Cervezas IPA
(2, 3, 1, 55.00), -- 1 Tacos de Birria
(2, 7, 1, 40.00), -- 1 Malteada Nutella
(3, 2, 1, 75.00), -- 1 Smash Truffle
(3, 5, 1, 35.00), -- 1 Papas Bacon Cheddar
(4, 4, 3, 50.00); -- 3 Tacos Pulled Pork