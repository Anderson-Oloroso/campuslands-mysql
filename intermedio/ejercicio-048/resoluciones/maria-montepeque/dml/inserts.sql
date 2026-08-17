-- Datos de practica: reservas de una agencia de viajes.
USE campuslands_mysql;

INSERT INTO reservas_viajes_intermedio (nombre_paquete, destino, categoria, precio, cliente, fecha_reserva) VALUES
('Escapada Caribe', 'Cartagena', 'playa', 1800000.00, 'Laura Gomez', '2026-01-05'),
('Crucero del Pacifico', 'Buenaventura', 'crucero', 3200000.00, 'Carlos Ruiz', '2026-01-10'),
('Ciudad Imperial', 'Bogota', 'ciudad', 620000.00, 'Ana Torres', '2026-01-15'),
('Ruta Colonial', 'Villa de Leyva', 'ciudad', 540000.00, 'Diego Perez', '2026-01-20'),
('Sol y Arena', 'Santa Marta', 'playa', 1450000.00, 'Laura Gomez', '2026-02-01'),
('Rafting Extremo', 'San Gil', 'aventura', 780000.00, 'Maria Lopez', '2026-02-05'),
('Cumbres Nevadas', 'Nevado del Ruiz', 'montana', 1100000.00, 'Carlos Ruiz', '2026-02-10'),
('Selva y Rio', 'Amazonas', 'aventura', 1650000.00, 'Ana Torres', '2026-02-15'),
('Escapada Caribe', 'Cartagena', 'playa', 1800000.00, 'Diego Perez', '2026-03-01'),
('Crucero del Pacifico', 'Buenaventura', 'crucero', 3200000.00, 'Laura Gomez', '2026-03-05');
