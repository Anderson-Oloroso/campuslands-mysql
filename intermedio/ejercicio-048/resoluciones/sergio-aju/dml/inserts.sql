USE campuslands_mysql;

-- Inserción de Clientes
INSERT INTO clientes (nombre, apellido, email, nacionalidad) VALUES
('Carlos', 'Mendoza', 'carlos.mendoza@email.com', 'Guatemalteca'),
('Valeria', 'Silva', 'valeria.silva@email.com', 'Mexicana'),
('Diego', 'Arriola', 'diego.arriola@email.com', 'Guatemalteca'),
('Sofía', 'Ramírez', 'sofia.ramirez@email.com', 'Colombiana'),
('Kenia', 'Rosales', 'kenia.rosales@email.com', 'Costa Rricense');

-- Inserción de Destinos Turísticos
INSERT INTO destinos (pais, ciudad, region) VALUES
('Guatemala', 'Antigua Guatemala', 'Centroamérica'),
('Guatemala', 'Atitlán', 'Centroamérica'),
('México', 'Cancún', 'Norteamérica'),
('Perú', 'Cusco', 'Sudamérica'),
('España', 'Barcelona', 'Europa');

-- Inserción de Paquetes Turísticos
INSERT INTO paquetes_turisticos (destino_id, nombre_paquete, duracion_dias, precio_persona, categoria) VALUES
(1, 'Ruta Colonial y Cafetales', 3, 250.00, 'Cultural'),
(2, 'Escapada Mística Lago Atitlán', 4, 380.00, 'Aventura'),
(3, 'Caribe Relax Todo Incluido', 5, 850.00, 'Premium'),
(4, 'Trek Machu Picchu Imperial', 6, 920.00, 'Aventura'),
(5, 'Descubriendo Barcelona y Gaudí', 7, 1200.00, 'Cultural'),
(1, 'Tour Express Antigua Volcanes', 2, 180.00, 'Económico');

-- Inserción de Reservas
INSERT INTO reservas (cliente_id, paquete_id, fecha_reserva, cantidad_personas, monto_total, estado) VALUES
(1, 1, '2026-01-15', 2, 500.00, 'Confirmada'),
(2, 3, '2026-02-10', 2, 1700.00, 'Confirmada'),
(3, 2, '2026-02-20', 3, 1140.00, 'Confirmada'),
(1, 4, '2026-03-05', 1, 920.00, 'Confirmada'),
(4, 5, '2026-03-12', 2, 2400.00, 'Confirmada'),
(5, 6, '2026-03-18', 4, 720.00, 'Confirmada'),
(2, 1, '2026-04-01', 1, 250.00, 'Cancelada'),
(3, 3, '2026-04-10', 2, 1700.00, 'Confirmada'),
(4, 2, '2026-05-02', 2, 760.00, 'Pendiente'),
(1, 6, '2026-05-15', 2, 360.00, 'Confirmada');