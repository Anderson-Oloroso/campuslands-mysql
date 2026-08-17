-- Datos de practica: carreras urbanas y sus dorsales asignados.
-- El numero de dorsal '101' se repite a proposito en varias carreras
-- distintas (permitido), pero nunca dos veces dentro de la MISMA carrera.
USE campuslands_mysql;

INSERT INTO carreras_intermedio (codigo_carrera, nombre_carrera, distancia_km, ciudad, fecha_carrera) VALUES
('BOG-10K', 'Carrera Urbana Bogota 10K', 10.00, 'Bogota', '2026-01-10'),
('MED-5K', 'Carrera Urbana Medellin 5K', 5.00, 'Medellin', '2026-01-24'),
('CAL-21K', 'Media Maraton Cali', 21.10, 'Cali', '2026-02-07'),
('BOG-42K', 'Maraton de Bogota', 42.20, 'Bogota', '2026-02-21'),
('MED-10K', 'Carrera Urbana Medellin 10K', 10.00, 'Medellin', '2026-03-07');

INSERT INTO dorsales_carrera_intermedio (id_carrera, numero_dorsal, corredor, tiempo_minutos) VALUES
(1, '101', 'Mateo Rivas', 48.50),
(1, '102', 'Santi Belmonte', 52.30),
(1, '103', 'Valeria Nunez', 49.90),
(2, '101', 'Diego Palma', 22.10),
(2, '102', 'Ruben Casal', 24.80),
(3, '101', 'Nico Farias', 105.20),
(3, '102', 'Andres Roble', 110.00),
(4, '101', 'Camilo Duarte', 220.40),
(5, '101', 'Julian Mesa', 50.75),
(5, '102', 'Felipe Nogales', 53.60);
