USE campuslands_mysql;

-- Inserción de al menos 8 registros de motocicletas para poblar el garaje
INSERT INTO garaje_motos_triggers (placa, marca, modelo, cilindrada_cc, anio_fabricacion, precio_comercial, estado_motos) VALUES
('M-101-ABC', 'Yamaha', 'MT-09', 890, 2024, 9500.00, 'disponible'),
('M-202-XYZ', 'Honda', 'CB650R', 649, 2023, 8700.50, 'alquilada'),
('M-303-DEF', 'Yamaha', 'MT-03', 321, 2022, 5200.00, 'disponible'),
('M-404-GHI', 'Suzuki', 'V-Strom 650', 645, 2021, 7200.00, 'en_mantenimiento'),
('M-505-JKL', 'BMW', 'G310GS', 313, 2023, 6100.00, 'reservada'),
('M-606-MNO', 'Yamaha', 'YZF-R1', 998, 2024, 15500.00, 'disponible'),
('M-707-PQR', 'Honda', 'CBR500R', 471, 2022, 6800.00, 'alquilada'),
('M-808-STU', 'Honda', 'Navi 110', 109, 2024, 2100.00, 'disponible');