USE campuslands_mysql;

INSERT INTO pedidos_marketplace_avanzado (codigo_pedido, cliente, accesorio, categoria, precio_unitario, cantidad, fecha_creacion, estado_pedido) VALUES
('PED-101', 'Sergio Ajú', 'Reloj Smartwatch Sport', 'Tecnología', 125.50, 1, '2026-08-18 10:00:00', 'pendiente'),
('PED-102', 'María Rodríguez', 'Bolso de Cuero Exec', 'Marroquinería', 89.99, 1, '2026-08-17 14:30:00', 'enviado'),
('PED-103', 'Carlos Pérez', 'Gafas de Sol Polarizadas', 'Optica', 45.00, 2, '2026-08-15 09:15:00', 'pendiente'), -- Caso límite: > 48 horas (debería expirar por el evento)
('PED-104', 'Ana Gómez', 'Pulsera de Plata 925', 'Joyería', 35.50, 3, '2026-08-16 16:00:00', 'entregado'),
('PED-105', 'Luis Martínez', 'Cinturón de Cuero Formal', 'Marroquinería', 29.99, 1, '2026-08-10 11:20:00', 'caducado'),
('PED-106', 'Sofía Torres', 'Mochila Antirrobo USB', 'Tecnología', 65.00, 1, '2026-08-14 08:00:00', 'pendiente'), -- Caso límite: > 48 horas (debería expirar por el evento)
('PED-107', 'Jorge Castillo', 'Cartera Minimalista RFID', 'Marroquinería', 25.00, 2, '2026-08-01 12:00:00', 'cancelado'),
('PED-108', 'Lucía Méndez', 'Audífonos Inalámbricos TWS', 'Tecnología', 55.00, 1, '2026-08-18 11:45:00', 'pendiente');