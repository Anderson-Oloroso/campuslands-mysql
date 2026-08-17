-- Datos de practica: catalogo de paquetes de una agencia de viajes.
-- codigo_paquete es la PRIMARY KEY (clave natural de catalogo).
USE campuslands_mysql;

INSERT INTO paquetes_turisticos_basico (codigo_paquete, nombre_paquete, destino, categoria, precio, duracion_dias) VALUES
('PLA-001', 'Escapada Caribe', 'Cartagena', 'playa', 1800000.00, 5),
('MON-001', 'Aventura Andina', 'Cocora', 'montana', 950000.00, 4),
('CIU-001', 'Ciudad Imperial', 'Bogota', 'ciudad', 620000.00, 3),
('AVE-001', 'Rafting Extremo', 'San Gil', 'aventura', 780000.00, 3),
('CRU-001', 'Crucero del Pacifico', 'Buenaventura', 'crucero', 3200000.00, 7),
('PLA-002', 'Sol y Arena', 'Santa Marta', 'playa', 1450000.00, 4),
('MON-002', 'Cumbres Nevadas', 'Nevado del Ruiz', 'montana', 1100000.00, 5),
('CIU-002', 'Ruta Colonial', 'Villa de Leyva', 'ciudad', 540000.00, 2),
('AVE-002', 'Selva y Rio', 'Amazonas', 'aventura', 1650000.00, 6);
