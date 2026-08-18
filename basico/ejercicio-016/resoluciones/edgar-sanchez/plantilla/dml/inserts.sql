

INSERT INTO categorias_menu (nombre_categoria, descripcion) VALUES
('Hamburguesas', 'Hamburguesas artesanales con carne premium y pan de masa madre'),
('Tacos Urbanos', 'Tacos estilo callejero con tortillas recién hechas y guisos variados'),
('Bebidas', 'Refrescos, aguas frescas naturales y bebidas artesanales');

INSERT INTO platillos (categoria_id, nombre_platillo, precio_usd, es_vegetariano) VALUES
(1, 'Street Smash Burger', 9.50, FALSE),
(1, 'Veggie Portobello Burger', 8.75, TRUE),
(2, 'Tacos de Birria Res (3 uds)', 7.00, FALSE),
(2, 'Tacos Veganos de Champiñón (3 uds)', 6.50, TRUE),
(3, 'Agua Fresca de Horchata 500ml', 2.50, TRUE);

INSERT INTO clientes (nombre_completo, telefono, email) VALUES
('Carlos Mendoza', '+502 5555-1234', 'carlos.mendoza@email.com'),
('Sofía Ramírez', '+502 5555-5678', 'sofia.ramirez@email.com'),
('Luis Hernández', '+502 5555-9012', 'luis.hernandez@email.com');

INSERT INTO ordenes_pedidos (cliente_id, fecha_orden, tipo_servicio, estado_orden) VALUES
(1, '2026-08-18 12:30:00', 'Consumo local', 'Entregado'),
(2, '2026-08-18 13:15:00', 'Para llevar', 'En preparación'),
(3, '2026-08-18 13:45:00', 'Domicilio', 'Pendiente');

INSERT INTO detalles_orden (orden_id, platillo_id, cantidad, precio_unitario_usd) VALUES
(1, 1, 2, 9.50),
(1, 5, 2, 2.50),
(2, 3, 1, 7.00),
(2, 5, 1, 2.50),
(3, 2, 1, 8.75);