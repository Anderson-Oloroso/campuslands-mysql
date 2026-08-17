-- Datos de practica: pedidos de un marketplace de accesorios.
USE campuslands_mysql;

INSERT INTO pedidos_basico (producto, categoria, precio, fecha_pedido, fecha_entrega_estimada, estado) VALUES
('Collar de Perlas', 'collares', 120.00, '2026-01-05', '2026-01-10', 'entregado'),
('Pulsera de Plata', 'pulseras', 60.00, '2026-01-12', '2026-01-16', 'entregado'),
('Aretes de Oro', 'aretes', 200.00, '2026-01-20', '2026-01-27', 'enviado'),
('Anillo Solitario', 'anillos', 300.00, '2026-02-01', '2026-02-06', 'pendiente'),
('Bolso de Cuero', 'bolsos', 250.00, '2026-02-08', '2026-02-18', 'enviado'),
('Collar Minimalista', 'collares', 90.00, '2026-02-15', '2026-02-19', 'entregado'),
('Pulsera Trenzada', 'pulseras', 45.00, '2026-02-20', '2026-02-24', 'cancelado'),
('Aretes Colgantes', 'aretes', 110.00, '2026-03-01', '2026-03-06', 'pendiente'),
('Anillo Doble Banda', 'anillos', 180.00, '2026-03-05', '2026-03-12', 'enviado');
