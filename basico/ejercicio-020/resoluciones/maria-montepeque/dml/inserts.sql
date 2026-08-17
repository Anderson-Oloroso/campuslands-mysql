-- Datos de practica: catalogo de diseños de un estudio de tatuajes.
USE campuslands_mysql;

INSERT INTO disenos_basico (nombre, estilo, tamano, precio, duracion_horas, disponible) VALUES
('Dragon Oriental', 'japones', 'grande', 650.00, 6.0, TRUE),
('Rosa Tradicional', 'tradicional', 'mediano', 280.00, 2.5, TRUE),
('Retrato Realista', 'realismo', 'grande', 720.00, 7.0, TRUE),
('Mandala Geometrico', 'blackwork', 'mediano', 350.00, 3.5, TRUE),
('Colibri Acuarela', 'acuarela', 'pequeno', 220.00, 2.0, TRUE),
('Linea Fina Minimalista', 'minimalista', 'pequeno', 150.00, 1.0, TRUE),
('Ancla Tradicional', 'tradicional', 'pequeno', 180.00, 1.5, FALSE),
('Koi Japones', 'japones', 'grande', 680.00, 6.5, TRUE),
('Craneo Blackwork', 'blackwork', 'grande', 500.00, 5.0, FALSE);
