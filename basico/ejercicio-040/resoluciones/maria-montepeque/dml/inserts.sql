-- Datos de practica: corredores inscritos en carreras urbanas.
USE campuslands_mysql;

INSERT INTO corredores_basico (nombre, categoria, tiempo_minutos, costo_inscripcion, resultado, fecha_carrera) VALUES
('Mateo Rivas', '10k', 48.50, 60000.00, 'finalizado', '2026-01-10'),
('Santi Belmonte', '5k', 22.30, 40000.00, 'finalizado', '2026-01-10'),
('Diego Palma', '21k', 105.20, 90000.00, 'finalizado', '2026-01-10'),
('Ruben Casal', '10k', 55.10, 60000.00, 'abandono', '2026-01-10'),
('Nico Farias', '42k', 220.40, 130000.00, 'finalizado', '2026-02-14'),
('Andres Roble', '5k', 21.80, 40000.00, 'finalizado', '2026-02-14'),
('Camilo Duarte', '21k', 110.00, 90000.00, 'descalificado', '2026-02-14'),
('Julian Mesa', '10k', 50.75, 60000.00, 'finalizado', '2026-02-14'),
('Felipe Nogales', '42k', 235.60, 130000.00, 'abandono', '2026-02-14');
