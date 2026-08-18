-- Datos de practica. Puedes cambiarlos o agregar mas filas.
USE campuslands_mysql;


INSERT INTO categorias_accesorios (nombre_categoria, descripcion) VALUES
('Joyería y Bisutería', 'Anillos, collares, pulseras y aretes artesanales y de moda'),
('Relojes y Smartwatches', 'Relojes análogos, digitales y bandas inteligentes'),
('Bolsos y Mochilas', 'Bolsos de mano, mochilas urbanas y billeteras de cuero');

INSERT INTO vendedores (nombre_tienda, correo, telefono, pais) VALUES
('Aura Studio Jewelry', 'contacto@aurastudio.com', '+502 2300-1111', 'Guatemala'),
('Urban Style Co.', 'info@urbanstyle.com', '+52 55 1234-5678', 'México'),
('Chronos Watch Store', 'ventas@chronoswatch.com', '+1 305 987-6543', 'Estados Unidos');

INSERT INTO productos_accesorios (vendedor_id, categoria_id, sku, nombre_producto, precio_usd, stock_disponible) VALUES
(1, 1, 'MKT-JWR-001', 'Collar de Plata Esmeralda', 45.00, 15),
(1, 1, 'MKT-JWR-002', 'Pulsera Artesanal Ajustable', 18.50, 0),
(2, 3, 'MKT-BAG-001', 'Mochila Urbana de Cuero', 85.00, 8),
(2, 3, 'MKT-BAG-002', 'Billetera Minimalista RFID', 25.00, 25),
(3, 2, 'MKT-WTC-001', 'Reloj Cronógrafo Clásico', 120.00, 10);

INSERT INTO ordenes_compra (codigo_orden, cliente_nombre, correo_cliente, fecha_orden, estado_orden) VALUES
('ORD-2026-101', 'Sofía Castillo', 'sofia.castillo@gmail.com', '2026-08-01 10:15:00', 'Entregado'),
('ORD-2026-102', 'Fernando López', 'fernando.lopez@outlook.com', '2026-08-05 14:30:00', 'Enviado'),
('ORD-2026-103', 'Valeria Ramírez', 'valeria.ramirez@yahoo.com', '2026-08-10 09:00:00', 'Pendiente'),
('ORD-2026-104', 'Diego Morales', 'diego.morales@gmail.com', '2026-08-12 16:45:00', 'Entregado');

INSERT INTO detalle_orden (orden_id, producto_id, cantidad, precio_unitario_usd) VALUES
(1, 1, 2, 45.00),
(1, 4, 1, 25.00),
(2, 3, 1, 85.00),
(3, 2, 3, 18.50),
(4, 5, 1, 120.00),
(4, 4, 2, 25.00);