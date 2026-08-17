-- Datos de practica: equipamiento de un club de pingpong.
-- Cada fila respeta el CHECK: solo llena el atributo de su tipo.
USE campuslands_mysql;

INSERT INTO equipamiento_pingpong_intermedio (nombre, tipo, precio, velocidad, rebote, dimension_cm) VALUES
('Raqueta Butterfly Timo Boll', 'raqueta', 320000, 95, NULL, NULL),
('Raqueta Stiga Pro Carbon', 'raqueta', 280000, 88, NULL, NULL),
('Raqueta DHS Hurricane', 'raqueta', 250000, 82, NULL, NULL),
('Pelota Estrella 3', 'pelota', 15000, NULL, 90, NULL),
('Pelota Entrenamiento', 'pelota', 8000, NULL, 70, NULL),
('Mesa Profesional ITTF', 'mesa', 4200000, NULL, NULL, 274),
('Mesa Club Plegable', 'mesa', 2800000, NULL, NULL, 274),
('Funda de Raqueta', 'accesorio', 25000, NULL, NULL, NULL),
('Malla y Postes', 'accesorio', 60000, NULL, NULL, NULL);
