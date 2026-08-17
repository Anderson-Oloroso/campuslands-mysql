-- DML: Inserción de 8 autos hiperdeportivos de alto rendimiento
USE campuslands_mysql;

INSERT INTO hiperdeportivos_avanzado 
(marca, modelo, anio_fabricacion, velocidad_maxima_kmh, precio_usd, estado) 
VALUES
('Bugatti', 'Chiron Super Sport', 2022, 440, 3800000.00, 'disponible'),
('Koenigsegg', 'Jesko Absolut', 2023, 530, 3400000.00, 'reservado'),
('Pagani', 'Huayra Roadster BC', 2021, 383, 3500000.00, 'exhibicion'),
('Rimac', 'Nevera', 2023, 412, 2400000.00, 'disponible'),
('Bugatti', 'Bolide', 2024, 500, 4400000.00, 'reservado'),
('McLaren', 'Speedtail', 2020, 403, 2250000.00, 'vendido'),
('Ferrari', 'SF90 XX Stradale', 2024, 320, 890000.00, 'disponible'),
('Aston Martin', 'Valkyrie', 2022, 355, 3200000.00, 'exhibicion');
