USE campuslands_mysql;

-- Inserción de Categorías
INSERT INTO categorias (nombre_categoria, descripcion) VALUES
('Bolsos y Mochilas', 'Bolsos de mano, mochilas ejecutivas y carteras de cuero'),
('Relojería', 'Relojes analógicos, digitales y cronógrafos de lujo'),
('Joyería y Bisutería', 'Anillos, cadenas, pulseras y dijes metálicos'),
('Gafas de Sol', 'Lentes con protección UV y monturas de acetato'),
('Accesorios de Cuero', 'Billeteras, cinturones y tarjeteros de cuero genuino');

-- Inserción de Vendedores / Tiendas
INSERT INTO vendedores (nombre_tienda, correo_contacto, comision_porcentaje, estado) VALUES
('BlackElegance Leather Co.', 'contacto@blackelegance.com', 8.00, 'Activo'),
('Chic & Style Boutique', 'ventas@chicandstyle.com', 6.50, 'Activo'),
('Urban Watches GT', 'info@urbanwatches.com', 10.00, 'Activo'),
('Luxor Jewelry Studio', 'soporte@luxorjewelry.com', 12.00, 'Activo');

-- Inserción de Clientes
INSERT INTO clientes (nombre, apellido, email, ciudad, fecha_registro) VALUES
('Sergio', 'Ajú', 'sergio.aju@email.com', 'Guatemala', '2026-01-15'),
('Mariana', 'López', 'mariana.lopez@email.com', 'Antigua Guatemala', '2026-01-20'),
('David', 'Gómez', 'david.gomez@email.com', 'Quetzaltenango', '2026-02-01'),
('Ana', 'Morales', 'ana.morales@email.com', 'Escuintla', '2026-02-10');

-- Inserción de Productos Accesorios (Mínimo 8 registros útiles)
INSERT INTO productos_accesorios (vendedor_id, categoria_id, nombre_producto, sku, precio, stock_disponible, color_dominante, material_principal, estado) VALUES
(1, 5, 'Billetera Ejecutiva Slim Minimalista', 'ACC-LWT-001', 250.00, 15, 'Negro', 'Cuero Vacuno', 'Disponible'),
(1, 5, 'Cinturón Elegante Vestir Reversible', 'ACC-LBT-002', 180.00, 3, 'Negro', 'Cuero Genuino', 'Disponible'),
(1, 1, 'Maletín para Laptop Exec-Black', 'ACC-BAG-003', 750.00, 2, 'Negro', 'Cuero Premium', 'Disponible'),
(2, 4, 'Gafas de Sol Aviador Dark Shade', 'ACC-SUN-004', 320.00, 20, 'Negro Matte', 'Metal y Acetato', 'Disponible'),
(2, 1, 'Mochila Urbana Impermeable Chic', 'ACC-BAG-005', 450.00, 0, 'Azul Marino', 'Nylon y Cuero', 'Agotado'),
(3, 2, 'Reloj Cronógrafo Stealth Matte', 'ACC-WTC-006', 1200.00, 8, 'Negro ONIX', 'Acero Inoxidable', 'Disponible'),
(3, 2, 'Reloj Minimalista Rose Gold', 'ACC-WTC-007', 950.00, 4, 'Oro Rosa', 'Malla Metálica', 'Disponible'),
(4, 3, 'Pulsera de Plata con Dije Monograma CS', 'ACC-JWL-008', 380.00, 12, 'Plateado', 'Plata Ley 925', 'Disponible');

-- Inserción de Pedidos Encabezado
INSERT INTO pedidos (cliente_id, fecha_pedido, monto_total, estado_pedido) VALUES
(1, '2026-03-01 10:15:00', 1000.00, 'Entregado'),
(2, '2026-03-02 14:30:00', 320.00, 'Enviado'),
(3, '2026-03-03 09:00:00', 1200.00, 'Pagado'),
(4, '2026-03-04 16:45:00', 380.00, 'Pendiente');

-- Inserción de Detalle de Pedidos
INSERT INTO detalle_pedidos (pedido_id, producto_id, cantidad, precio_unitario) VALUES
(1, 1, 1, 250.00), -- Billetera
(1, 3, 1, 750.00), -- Maletín
(2, 4, 1, 320.00), -- Gafas
(3, 6, 1, 1200.00),-- Reloj Stealth
(4, 8, 1, 380.00); -- Pulsera Plata