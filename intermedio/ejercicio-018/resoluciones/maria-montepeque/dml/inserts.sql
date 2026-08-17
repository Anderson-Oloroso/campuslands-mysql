-- Datos de practica: reservas de paquetes turisticos.
USE campuslands_mysql;

INSERT INTO reservas_intermedio (destino, categoria, viajeros, precio_total, fecha_viaje, estado) VALUES
('Cartagena', 'playa', 2, 1700.00, '2026-01-10', 'confirmada'),
('Santa Marta', 'playa', 4, 2480.00, '2026-01-22', 'confirmada'),
('Medellin', 'ciudad', 2, 1080.00, '2026-02-05', 'confirmada'),
('Bogota', 'cultural', 3, 1440.00, '2026-02-18', 'pendiente'),
('San Andres', 'playa', 2, 1980.00, '2026-03-01', 'confirmada'),
('Guatape', 'aventura', 5, 1600.00, '2026-03-14', 'cancelada'),
('Armenia', 'cultural', 2, 820.00, '2026-04-02', 'confirmada'),
('Villa de Leyva', 'montana', 3, 1170.00, '2026-04-20', 'pendiente'),
('Cartagena', 'playa', 3, 2550.00, '2026-05-08', 'confirmada'),
('Guatape', 'aventura', 2, 640.00, '2026-05-15', 'confirmada');
