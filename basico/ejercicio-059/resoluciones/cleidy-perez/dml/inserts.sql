-- Datos de practica. Puedes cambiarlos o agregar mas filas.
USE campuslands_mysql;

INSERT INTO Usuarios (nombre, correo, fecha_ultimo_acceso) VALUES
('Sofia Lopez', 'sofia@mail.com', '2026-07-25 14:30:00'),
('Mateo Ramirez', 'mateo@mail.com', '2026-07-26 09:15:00'),
('Lucia Fernandez', 'lucia@mail.com', '2026-07-20 18:45:00');

INSERT INTO Productos (nombre, categoria, precio) VALUES
('Reloj de Cuero Vintage', 'Relojes', 120.00),
('Collar de Plata 925', 'Joyería', 45.50),
('Bolso de Mano Elegante', 'Bolsos', 85.00);

INSERT INTO Pedidos (usuario_id, producto_id, monto_total, estado, fecha_pedido, fecha_envio, fecha_entrega_estimada, fecha_entrega_real) VALUES
(1, 1, 120.00, 'Entregado', '2026-07-01 10:00:00', '2026-07-02 15:00:00', '2026-07-05', '2026-07-04 11:20:00'),
(2, 2, 45.50, 'Enviado', '2026-07-24 16:20:00', '2026-07-25 09:00:00', '2026-07-28', NULL),
(3, 3, 85.00, 'Pendiente', '2026-07-26 20:10:00', NULL, '2026-07-30', NULL);