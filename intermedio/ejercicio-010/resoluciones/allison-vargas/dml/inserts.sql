-- DML: Inserción de escuderías y vehículos respetando las unicidades (UNIQUE)
USE campuslands_mysql;

INSERT INTO escuderias_carreras (nombre_escuderia, codigo_escuderia, patrocinador_principal, pais_origen) VALUES
('Apex Motors GT', 'APX-GT', 'Red Bull', 'Guatemala'),
('Velocity Underground', 'VEL-UG', 'Monster Energy', 'Japón'),
('Street Kings Club', 'SKC-99', 'Sparco', 'Estados Unidos'),
('Turbo Nitro Speed', 'TNS-01', 'Pirelli', 'Alemania');

INSERT INTO autos_carreras (escuderia_id, numero_vin, numero_competencia, modelo, potencia_hp, estado) VALUES
(1, '1N4AL3AP1JC100001', 7, 'Nissan GT-R R35', 560, 'listo'),
(1, '1N4AL3AP1JC100002', 77, '370Z Nismo', 350, 'listo'),
(2, 'JM1FD333100000003', 13, 'Mazda RX-7 FD', 450, 'listo'),
(2, 'JM1FD333100000004', 31, 'Subaru WRX STI', 310, 'en_mantenimiento'),
(3, '1FA6P8CF0R5000005', 99, 'Ford Mustang GT', 480, 'listo'),
(3, '1FA6P8CF0R5000006', 9, 'Dodge Challenger SRT', 707, 'descalificado'),
(4, 'WP0ZZZ99ZTS000007', 1, 'Porsche 911 GT2 RS', 700, 'listo'),
(4, 'WP0ZZZ99ZTS000008', 11, 'Audi R8 V10', 610, 'listo');
