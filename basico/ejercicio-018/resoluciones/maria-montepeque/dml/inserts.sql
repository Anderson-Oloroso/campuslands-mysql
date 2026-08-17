-- Datos de practica: catalogo de destinos turisticos.
-- codigo_destino es la PRIMARY KEY (clave natural de 3 letras).
USE campuslands_mysql;

INSERT INTO destinos_basico (codigo_destino, nombre, pais, categoria, precio_paquete, calificacion) VALUES
('CTG', 'Cartagena', 'Colombia', 'playa', 850.00, 4.70),
('SMR', 'Santa Marta', 'Colombia', 'playa', 620.00, 4.30),
('MDE', 'Medellin', 'Colombia', 'ciudad', 540.00, 4.60),
('BOG', 'Bogota', 'Colombia', 'cultural', 480.00, 4.10),
('SAI', 'San Andres', 'Colombia', 'playa', 990.00, 4.80),
('GUA', 'Guatape', 'Colombia', 'aventura', 320.00, 4.90),
('ARM', 'Armenia', 'Colombia', 'cultural', 410.00, 4.20),
('VLL', 'Villa de Leyva', 'Colombia', 'montana', 390.00, 4.50);
