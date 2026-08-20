USE campuslands_mysql;

-- Inserción de Productos (8 registros)
INSERT INTO productos_accesorios (nombre, categoria, precio, stock, en_promocion, descuento_porcentaje, fecha_fin_promocion) VALUES
('Reloj Cronógrafo de Cuero', 'Relojes', 1200.00, 15, 1, 15.00, '2026-08-15 10:00:00'), -- Promoción Vencida
('Mochila Ejecutiva Impermeable', 'Mochilas', 450.00, 25, 1, 20.00, '2026-12-31 23:59:59'), -- Promoción Vigente
('Lentes de Sol Aviador', 'Lentes', 350.00, 40, 0, 0.00, NULL),
('Cadena de Plata Ley 925', 'Joyería', 280.00, 10, 1, 10.00, '2026-08-01 12:00:00'), -- Promoción Vencida
('Funda de Piel para Laptop 15"', 'Fundas', 190.00, 50, 0, 0.00, NULL),
('Anillo de Titanio Negro', 'Joyería', 150.00, 30, 0, 0.00, NULL),
('Reloj Deportivo Inteligente', 'Relojes', 850.00, 8, 1, 25.00, '2026-08-18 18:00:00'), -- Promoción Vencida
('Billetera Elegante de Piel', 'Mochilas', 120.00, 60, 0, 0.00, NULL);

-- Inserción de Carritos (8 registros)
INSERT INTO carritos_compras (usuario_id, producto_id, cantidad, estado, ultima_actualizacion) VALUES
(101, 1, 1, 'Activo', '2026-08-10 09:00:00'), -- Inactivo (Debe marcarse Abandonado)
(102, 3, 2, 'Activo', '2026-08-10 14:30:00'), -- Inactivo (Debe marcarse Abandonado)
(103, 2, 1, 'Comprado', NOW()),
(104, 5, 1, 'Activo', NOW()), -- Reciente (Mantiene estado Activo)
(105, 4, 3, 'Activo', '2026-08-11 08:00:00'), -- Inactivo (Debe marcarse Abandonado)
(106, 7, 1, 'Comprado', NOW()),
(107, 6, 2, 'Activo', NOW()), -- Reciente
(108, 8, 1, 'Activo', '2026-08-05 11:20:00'); -- Inactivo

-- Inserción de Pedidos (8 registros para pruebas de historial)
INSERT INTO pedidos (usuario_id, total, estado, fecha_pedido) VALUES
(103, 360.00, 'Completado', '2026-08-18 10:15:00'),
(106, 637.50, 'Completado', '2026-08-18 14:22:00'),
(109, 280.00, 'Completado', '2026-08-18 19:40:00'),
(110, 1200.00, 'Completado', CURRENT_TIMESTAMP),
(111, 450.00, 'Completado', CURRENT_TIMESTAMP),
(112, 190.00, 'Cancelado', CURRENT_TIMESTAMP),
(113, 350.00, 'Completado', '2026-08-17 11:00:00'),
(114, 150.00, 'Completado', '2026-08-17 16:30:00');