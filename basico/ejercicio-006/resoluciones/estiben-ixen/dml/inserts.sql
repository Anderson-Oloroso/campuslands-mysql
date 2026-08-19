-- Insercion de datos para autos hiperdeportivos (ejercicio-006)
USE campuslands_mysql;

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
=======
USE campuslands_mysql;

INSERT INTO autos
(
marca,
modelo,
pais_origen,
anio,
velocidad_maxima,
potencia_hp,
precio,
estado,
fecha_fabricacion
)
VALUES

('Bugatti','Chiron Super Sport','Francia',2023,490,1600,5200000.00,'Disponible','2023-02-15'),

('Koenigsegg','Jesko Absolut','Suecia',2024,531,1600,3500000.00,'Disponible','2024-01-20'),

('Pagani','Huayra R','Italia',2022,383,850,3200000.00,'Reservado','2022-05-08'),

('Ferrari','SF90 Stradale','Italia',2023,340,986,625000.00,'Disponible','2023-04-14'),

('Lamborghini','Revuelto','Italia',2024,350,1001,710000.00,'Disponible','2024-03-18'),

('McLaren','Speedtail','Reino Unido',2021,403,1055,2400000.00,'Vendido','2021-09-27'),

('Rimac','Nevera','Croacia',2023,412,1914,2300000.00,'Disponible','2023-06-11'),

('Aston Martin','Valkyrie','Reino Unido',2022,402,1160,3100000.00,'Reservado','2022-07-24'),

('SSC','Tuatara','Estados Unidos',2023,508,1750,1950000.00,'Disponible','2023-11-10'),

('Hennessey','Venom F5','Estados Unidos',2024,500,1817,2100000.00,'Disponible','2024-02-05');
