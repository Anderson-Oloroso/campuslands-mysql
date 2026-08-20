USE campuslands_mysql;

INSERT INTO fabricantes (nombre) VALUES 
('Bugatti'), ('Koenigsegg'), ('Pagani'), ('Rimac'), ('McLaren');

INSERT INTO hiperdeportivos (fabricante_id, modelo, velocidad_maxima_kmh, precio_millones, anio_lanzamiento, estado) VALUES
(1, 'Chiron Super Sport', 440, 3.50, 2022, 'limitado'),
(2, 'Jesko Absolut', 480, 3.00, 2023, 'limitado'),
(3, 'Huayra R', 380, 2.80, 2021, 'limitado'),
(4, 'Nevera', 412, 2.20, 2023, 'en_produccion'),
(5, 'Speedtail', 403, 2.30, 2020, 'limitado'),
(1, 'Divo', 380, 5.00, 2019, 'limitado'),
(2, 'Gemera', 400, 1.70, 2024, 'en_produccion'),
(3, 'Utopia', 370, 2.50, 2023, 'en_produccion');