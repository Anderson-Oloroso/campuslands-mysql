INSERT INTO categorias_menu (nombre_categoria, descripcion) VALUES
('Burgers Urbanas', 'Hamburguesas artesanales con carne premium y pan brioche.'),
('Tacos & Street Food', 'Tacos urbanos y antojitos al estilo callejero gourmet.'),
('Bebidas Artesanales', 'Refrescos, sodas de la casa y cervezas artesanales.');

INSERT INTO productos_comida (categoria_id, nombre_producto, precio_venta_usd, es_vegetariano) VALUES
(1, 'Smash Burger Doble', 9.50, FALSE),
(1, 'Veggie Monster Burger', 8.75, TRUE),
(2, 'Tacos de Birria Res (3 uds)', 7.00, FALSE),
(2, 'Tacos de Champiñones al Pastor (3 uds)', 6.50, TRUE),
(3, 'Limonada con Jengibre y Menta', 3.00, TRUE),
(3, 'Cerveza IPA Artesanal', 4.50, TRUE);

INSERT INTO mesas_restaurante (numero_mesa, capacidad_personas, ubicacion_zona) VALUES
(1, 2, 'Barra'),
(2, 4, 'Interior'),
(3, 6, 'Terraza');

INSERT INTO ordenes_restaurante (mesa_id, fecha_hora_orden, nombre_mesero, estado_orden) VALUES
(1, '2026-08-18 12:30:00', 'Carlos Gómez', 'Atendida'),
(2, '2026-08-18 13:15:00', 'Andrea López', 'Atendida'),
(3, '2026-08-18 13:40:00', 'Carlos Gómez', 'En proceso');

INSERT INTO detalles_orden_comida (orden_id, producto_id, cantidad, precio_unitario_usd) VALUES
(1, 1, 1, 9.50),
(1, 5, 1, 3.00),
(2, 2, 2, 8.75),
(2, 4, 1, 6.50),
(2, 6, 2, 4.50),
(3, 3, 3, 7.00),
(3, 5, 3, 3.00);
