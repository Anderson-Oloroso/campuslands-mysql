use garaje_motos_db;

insert into marcas_moto (nombre_marca, pais_origen) values
('Yamaha', 'Japón'),
('Honda', 'Japón'),
('Kawasaki', 'Japón'),
('Ducati', 'Italia'),
('KTM', 'Austria'),
('BMW', 'Alemania');

insert into motos_garaje (id_marca, modelo, cilindrada_cc, anio_fabricacion, costo_mantenimiento_mensual, estado_operativo) values
(1, 'YZF-R3', 321, 2024, 75.50, 'activo'),
(1, 'MT-09 SP', 890, 2025, 140.00, 'activo'),
(2, 'CBR 600RR', 599, 2023, 160.00, 'en_reparacion'),
(2, 'CB 500F', 471, 2022, 60.00, 'activo'),
(3, 'Ninja 400', 399, 2024, 85.00, 'en_venta'),
(3, 'Z900', 948, 2023, 175.00, 'activo'),
(4, 'Panigale V2', 955, 2024, 280.00, 'activo'),
(4, 'Monster 937', 937, 2022, 210.00, 'en_reparacion'),
(5, 'Duke 390', 373, 2023, 90.00, 'activo'),
(5, 'Super Duke 1290 R', 1301, 2024, 320.00, 'en_venta'),
(6, 'S 1000 RR', 999, 2025, 300.00, 'activo'),
(6, 'G 310 R', 313, 2022, 50.00, 'baja');