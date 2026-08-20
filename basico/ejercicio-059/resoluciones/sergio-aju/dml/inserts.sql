USE campuslands_mysql;

TRUNCATE TABLE pedidos_accesorios;

INSERT INTO pedidos_accesorios (cliente_nombre, producto_accesorio, fecha_pedido, precio_usd, estado_pedido) VALUES
('Sergio Aju', 'Reloj de lujo', '2026-08-01 10:00:00', 250.00, 'entregado'),
('Byron Ajcet', 'Gafas de sol', '2026-08-10 14:30:00', 85.50, 'enviado'),
('Maria Lopez', 'Pulsera de plata', '2026-08-15 09:15:00', 45.00, 'pendiente'),
('Juan Perez', 'Correa de cuero', '2026-07-20 16:45:00', 30.00, 'entregado'),
('Luisa Gomez', 'Anillo de oro', '2026-08-18 11:20:00', 500.00, 'pendiente'),
('Pedro Ruiz', 'Bolso ejecutivo', '2026-06-15 08:00:00', 120.00, 'cancelado'),
('Ana Diaz', 'Bufanda seda', '2026-08-19 09:00:00', 55.00, 'pendiente'),
('Carlos Solis', 'Sombrero playa', '2026-05-10 17:00:00', 40.00, 'entregado');