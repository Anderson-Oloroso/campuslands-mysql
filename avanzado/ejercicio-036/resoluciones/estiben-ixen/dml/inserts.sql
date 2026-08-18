-- Insercion de datos para autos hiperdeportivos (ejercicio-036)
USE campuslands_mysql;

-- Insercion en fabricantes_autos
INSERT INTO fabricantes_autos (marca, pais_origen, fundacion, estado) VALUES
('Bugatti', 'Francia', 1909, 'Activo'),
('Koenigsegg', 'Suecia', 1994, 'Activo'),
('Pagani', 'Italia', 1992, 'Activo'),
('Ferrari', 'Italia', 1939, 'Activo'),
('Rimac', 'Croacia', 2009, 'Activo'),
('McLaren', 'Reino Unido', 1963, 'Activo');

-- Insercion en autos_hiperdeportivos
INSERT INTO autos_hiperdeportivos (modelo, id_fabricante, caballos_fuerza, velocidad_max, precio_millones, tipo_motor, fecha_lanzamiento) VALUES
('Chiron Super Sport 300+', 1, 1600, 490.48, 3.90, 'W16 Quad-Turbo', '2019-09-02'),
('Bolide', 1, 1850, 500.00, 4.40, 'W16 Quad-Turbo', '2020-10-28'),
('Jesko Absolut', 2, 1600, 531.00, 3.40, 'V8 Twin-Turbo', '2020-03-03'),
('Gemera', 2, 1700, 400.00, 1.70, 'Hibrido', '2020-03-03'),
('Huayra Roadster BC', 3, 802, 380.00, 3.50, 'V12 Atmosferico', '2019-07-31'),
('Utopia', 3, 864, 380.00, 2.50, 'V12 Atmosferico', '2022-09-12'),
('SF90 XX Stradale', 4, 1030, 320.00, 0.89, 'Hibrido', '2023-06-29'),
('LaFerrari Aperta', 4, 963, 350.00, 2.20, 'Hibrido', '2016-09-29'),
('Nevera', 5, 1914, 412.00, 2.40, 'Electrico Puro', '2021-06-01'),
('Speedtail', 6, 1070, 403.00, 2.25, 'Hibrido', '2018-10-26'),
('Senna GTR', 6, 825, 340.00, 1.40, 'V8 Twin-Turbo', '2019-03-05'),
('P1 GTR', 6, 1000, 362.00, 2.70, 'Hibrido', '2015-03-03');

