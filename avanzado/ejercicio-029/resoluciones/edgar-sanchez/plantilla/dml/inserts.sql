INSERT INTO usuarios_clientes (nombre_completo, correo, estado_cuenta) VALUES
('Carlos Arriola', 'carlos.arriola@email.com', 'Activo'),
('Lucía Morales', 'lucia.morales@email.com', 'Activo'),
('Roberto Gómez', 'roberto.gomez@email.com', 'Inactivo');

INSERT INTO productos_accesorios (nombre_producto, categoria, precio_unitario, stock_disponible) VALUES
('Reloj Cronógrafo Deportivo', 'Relojes', 250.00, 15),
('Gafas de Sol Polarizadas', 'Lentes', 85.00, 30),
('Pulsera de Plata 925', 'Joyería', 120.00, 8),
('Bolso de Mano en Cuero', 'Bolsos', 310.00, 5);

INSERT INTO pedidos_cabecera (usuario_id, monto_total, estado_pedido, fecha_pedido) VALUES
(1, 250.00, 'Pendiente', '2026-08-18 10:00:00'),
(2, 85.00, 'Pendiente', '2026-08-17 14:00:00'),
(3, 120.00, 'Pagado', '2026-08-18 11:30:00');

INSERT INTO pedidos_detalles (pedido_id, producto_id, cantidad, precio_historico) VALUES
(1, 1, 1, 250.00),
(2, 2, 1, 85.00),
(3, 3, 1, 120.00);

INSERT INTO cupones_descuento (codigo_cupon, porcentaje_descuento, fecha_expiracion, estado_cupon) VALUES
('VERANO2026', 15.00, '2026-08-17 23:59:59', 'Activo'),
('BIENVENIDA10', 10.00, '2026-08-31 23:59:59', 'Activo'),
('FLASH50', 50.00, '2026-08-15 12:00:00', 'Activo');