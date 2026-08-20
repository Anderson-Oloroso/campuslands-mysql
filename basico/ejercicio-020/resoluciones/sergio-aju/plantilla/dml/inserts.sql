USE campuslands_mysql;

-- Inserción de 8 registros de diseños de tatuajes
INSERT INTO disenos_tatuajes (nombre_diseno, estilo, duracion_estimada_horas, precio, calificacion, estado) VALUES
('Dragón Oriental Espalda', 'Irezumi / Japones', 6.5, 450.00, 4.90, 'disponible'),
('Rosa Realista B&G', 'Realismo', 3.0, 220.00, 4.80, 'disponible'),
('Calavera Neotradicional', 'Neotradicional', 4.0, 280.00, 4.70, 'disponible'),
('Serpiente y Daga', 'Traditional / Old School', 2.5, 180.00, 4.85, 'disponible'),
('Geometría Sagrada Antebrazo', 'Geométrico', 3.5, 250.00, 4.60, 'reservado'),
('Microrealismo Mascota', 'Realismo', 2.0, 190.00, 4.95, 'disponible'),
('Brazalete Polinesio', 'Tribal / Blackwork', 4.5, 300.00, 4.30, 'disponible'),
('Mariposa Minimalista', 'Fine Line', 1.0, 90.00, 4.10, 'inactivo');