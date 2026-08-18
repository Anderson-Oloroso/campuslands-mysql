-- Insertar Tiendas (6 registros)
INSERT INTO tiendas (nombre, email_contacto) VALUES
('Luxury Watches Co.', 'contacto@luxurywatches.com'),
('Gafas & Estilo', 'ventas@gafasyestilo.com'),
('Joyería Artesanal Luna', 'info@joyerialuna.com'),
('Bolsos y Piel Premium', 'admin@bolsosypiel.com'),
('Urban Accessories', 'hola@urbanacc.com'),
('Chic Details Store', 'soporte@chicdetails.com');

-- Insertar Productos con ofertas vencidas y activas (6 registros)
INSERT INTO productos (id_tienda, nombre, categoria, precio, precio_oferta, fin_oferta, stock) VALUES
(1, 'Reloj Cronógrafo de Acero', 'Relojes', 250.00, 180.00, '2026-08-01 00:00:00', 15), -- Oferta Vencida
(2, 'Gafas de Sol Polarizadas Aviador', 'Gafas', 85.00, 60.00, '2026-12-31 23:59:59', 30),  -- Oferta Activa
(3, 'Collar de Plata esterlina 925', 'Joyería', 120.00, 90.00, '2026-08-10 12:00:00', 8),   -- Oferta Vencida
(4, 'Bolso de Mano Cuero Vacuno', 'Bolsos', 195.00, 150.00, '2026-08-15 18:00:00', 5),    -- Oferta Vencida
(5, 'Cinturón de Piel Ajustable', 'Cinturones', 45.00, 35.00, '2026-10-01 00:00:00', 50),  -- Oferta Activa
(6, 'Pulsera de Ancla Minimalista', 'Joyería', 35.00, 25.00, '2026-08-05 09:00:00', 20);   -- Oferta Vencida

-- Insertar Carritos de Compras antiguos e inactivos (6 registros)
INSERT INTO carrito_compras (id_usuario, id_producto, cantidad, fecha_actualizacion) VALUES
(101, 1, 1, '2026-07-01 10:00:00'), -- Viejo (> 30 días)
(102, 3, 2, '2026-06-15 14:30:00'), -- Viejo (> 30 días)
(103, 2, 1, NOW()),                -- Reciente
(104, 4, 1, '2026-05-20 18:00:00'), -- Viejo (> 30 días)
(105, 5, 3, NOW()),                -- Reciente
(106, 6, 1, '2026-07-10 11:20:00'); -- Viejo (> 30 días)

-- Insertar Ejercicios (6 registros con el Ejercicio 029)
INSERT INTO ejercicios (codigo, titulo, dificultad, tematica) VALUES
('EJ-025', 'Vistas Mantenibles para Marketplace', 'Intermedio', 'marketplace de accesorios'),
('EJ-026', 'Triggers para Control de Stock Automático', 'Avanzado', 'marketplace de accesorios'),
('EJ-027', 'Stored Procedures para Procesamiento de Órdenes', 'Avanzado aplicado', 'marketplace de accesorios'),
('EJ-028', 'Transacciones ACID en Pagos de Pedidos', 'Avanzado aplicado', 'marketplace de accesorios'),
('EJ-029', 'event scheduler para marketplace de accesorios', 'Avanzado aplicado', 'marketplace de accesorios'),
('EJ-030', 'Optimización e Índices para Búsqueda de Productos', 'Avanzado', 'marketplace de accesorios');