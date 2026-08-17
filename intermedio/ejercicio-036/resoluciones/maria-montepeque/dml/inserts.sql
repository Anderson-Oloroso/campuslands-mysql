-- Datos de practica: autos hiperdeportivos y sus caracteristicas.
-- Cada herramienta/caracteristica usada en un auto es una fila propia (1FN).
USE campuslands_mysql;

INSERT INTO autos_intermedio (marca, modelo, precio) VALUES
('Ferrari', 'SF90 Stradale', 625000.00),
('Lamborghini', 'Revuelto', 608000.00),
('McLaren', '750S', 324000.00),
('Bugatti', 'Chiron', 3200000.00),
('Porsche', '911 GT2 RS', 315000.00);

INSERT INTO caracteristicas_auto_intermedio (id_auto, caracteristica) VALUES
(1, 'Fibra de carbono'),
(1, 'Hibrido enchufable'),
(1, 'Suspension activa'),
(2, 'Hibrido'),
(2, 'Traccion integral'),
(2, 'Fibra de carbono'),
(3, 'Aerodinamica activa'),
(3, 'Freno ceramico'),
(4, 'Motor W16'),
(4, 'Traccion integral'),
(4, 'Freno ceramico'),
(5, 'Freno ceramico'),
(5, 'Suspension activa');
