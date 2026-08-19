use garaje_motos_db;

insert into tipos_motor (cilindrada_cc, categoria_motor) values
(125, 'urbana ligera'),
(250, 'deportiva baja'),
(400, 'naked mediana'),
(650, 'alta cilindrada'),
(1000, 'superdeportiva');

insert into garaje_motos (placa, marca, modelo, anio_fabricacion, id_tipo_motor, kilometraje, tarifa_mantenimiento, estado_operativo) values
('mta-101', 'yamaha', 'mt-03', 2024, 2, 12500, 45.00, 'en servicio'),
('hnd-202', 'honda', 'cbrtorque', 2023, 3, 24000, 60.50, 'en servicio'),
('kaw-303', 'kawasaki', 'ninja 400', 2025, 3, 5200, 75.00, 'en servicio'),
('suz-404', 'suzuki', 'gsx-s750', 2022, 4, 38000, 110.00, 'en reparacion'),
('duc-505', 'ducati', 'panigale v4', 2026, 5, 1500, 250.00, 'en servicio'),
('ktm-606', 'ktm', 'duke 200', 2023, 1, 18500, 35.00, 'en servicio'),
('bmw-707', 'bmw', 's1000rr', 2024, 5, 8900, 220.00, 'fuera de servicio'),
('tri-808', 'triumph', 'street triple', 2025, 4, 4200, 140.00, 'en servicio');