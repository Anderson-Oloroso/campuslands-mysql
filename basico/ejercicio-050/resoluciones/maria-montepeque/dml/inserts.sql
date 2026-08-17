-- Datos de practica: catalogo de disenos de un estudio de tatuajes.
USE campuslands_mysql;

INSERT INTO disenos_basico (nombre, estilo, tatuador, precio, disponible) VALUES
('Dragon Oriental', 'tradicional', 'Pedro Ariza', 250.00, TRUE),
('Retrato Realista', 'realismo', 'Sofia Herrera', 320.00, TRUE),
('Mandala Geometrico', 'blackwork', 'Camila Ortiz', 180.00, TRUE),
('Flores en Acuarela', 'acuarela', 'Julian Vega', 210.00, TRUE),
('Linea Fina Minimalista', 'minimalista', 'Pedro Ariza', 90.00, FALSE),
('Dragon Japones', 'tradicional', 'Sofia Herrera', 260.00, TRUE),
('Leon Realista', 'realismo', 'Camila Ortiz', 300.00, TRUE),
('Patron Blackwork Tribal', 'blackwork', 'Julian Vega', 150.00, FALSE),
('Ave Fenix Acuarela', 'acuarela', 'Pedro Ariza', 230.00, TRUE);
