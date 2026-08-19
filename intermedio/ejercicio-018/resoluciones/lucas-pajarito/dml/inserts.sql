USE intermedio_viajes_turismo;

-- Carga de Destinos
INSERT INTO destinos_018 (nombre, pais, precio_base) VALUES
('Machu Picchu', 'Perú', 350.00),
('Cancún', 'México', 450.00),
('Antigua Guatemala', 'Guatemala', 200.00),
('Salar de Uyuni', 'Bolivia', 300.00),
('Cartagena de Indias', 'Colombia', 280.00),
('Cusco Imperial', 'Perú', 220.00);

-- Carga de Turistas
INSERT INTO turistas_018 (pasaporte, nombre, nacionalidad, correo) VALUES
('PAS-A1234567', 'Lucas Pajarito', 'Guatemalteca', 'lucas.pajarito@email.com'),
('PAS-B9876543', 'Mariana Estrada', 'Mexicana', 'mariana.estrada@email.com'),
('PAS-C4567891', 'Mateo Morales', 'Colombiano', 'mateo.morales@email.com'),
('PAS-D7891234', 'Sofia Ruiz', 'Peruana', 'sofia.ruiz@email.com'),
('PAS-E3216549', 'Gabriel Estrada', 'Guatemalteca', 'gabriel.estrada@email.com');

-- Carga de Tours
INSERT INTO tours_018 (nombre_tour, destino_id, duracion_dias) VALUES
('Camino del Inca Express', 1, 4),
('Escapada Tropical Caribeña', 2, 5),
('Ruta Colonial e Histórica', 3, 2),
('Aventura Espejo de Sal', 4, 3),
('Caribe Colonial y Playas', 5, 4),
('Valle Sagrado y Tradición', 6, 3);

-- Carga de Reservas
INSERT INTO reservas_018 (tour_id, turista_pasaporte, fecha_reserva, personas, monto_total) VALUES
(1, 'PAS-A1234567', '2026-09-01', 2, 700.00),
(2, 'PAS-B9876543', '2026-09-05', 1, 450.00),
(3, 'PAS-A1234567', '2026-09-10', 3, 600.00),
(4, 'PAS-C4567891', '2026-09-15', 2, 600.00),
(5, 'PAS-D7891234', '2026-09-20', 1, 280.00),
(1, 'PAS-E3216549', '2026-09-22', 4, 1400.00),
(3, 'PAS-B9876543', '2026-09-25', 2, 400.00),
(6, 'PAS-D7891234', '2026-09-28', 2, 440.00);