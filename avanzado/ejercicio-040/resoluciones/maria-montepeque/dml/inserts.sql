-- Datos de practica: resultados de corredores en distintas carreras urbanas.
USE campuslands_mysql;

INSERT INTO resultados_avanzado (corredor, carrera, categoria, tiempo_minutos, posicion) VALUES
('Mateo Rivas', 'Carrera Urbana Bogota 10K', '10k', 48.50, 1),
('Santi Belmonte', 'Carrera Urbana Bogota 10K', '10k', 52.30, 2),
('Diego Palma', 'Media Maraton Cali', '21k', 105.20, 1),
('Ruben Casal', 'Media Maraton Cali', '21k', 110.00, 2),
('Nico Farias', 'Maraton de Bogota', '42k', 220.40, 1),
('Andres Roble', 'Carrera Urbana Medellin 5K', '5k', 21.80, 1),
('Camilo Duarte', 'Carrera Urbana Medellin 5K', '5k', 22.30, 2),
('Julian Mesa', 'Maraton de Bogota', '42k', 235.60, 2);
