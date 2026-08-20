-- Datos de practica. Puedes cambiarlos o agregar mas filas.
USE campuslands_mysql;
INSERT INTO marcas_moto (nombre_marca, pais_origen, sitio_web) VALUES
('Yamaha', 'Japón', 'https://www.yamaha-motor.com'),
('Honda', 'Japón', 'https://www.honda.com'),
('Ducati', 'Italia', 'https://www.ducati.com'),
('BMW Motorrad', 'Alemania', 'https://www.bmw-motorrad.com');

INSERT INTO clientes_garaje (nombre_cliente, correo, telefono, fecha_registro) VALUES
('Roberto Méndez', 'roberto.mendez@email.com', '+502 5555-0101', '2026-01-10'),
('Ana Lucía Torres', 'ana.torres@email.com', '+502 5555-0102', '2026-01-15'),
('Gabriel Estrada', 'gabriel.estrada@email.com', '+502 5555-0103', '2026-02-01'),
('Sofía Monterroso', 'sofia.monterroso@email.com', '+502 5555-0104', '2026-02-20');

INSERT INTO modelos_moto (marca_id, nombre_modelo, cilindrada_cc, tipo_moto) VALUES
(1, 'MT-07', 689, 'Naked'),
(1, 'YZF-R6', 599, 'Deportiva'),
(2, 'CB500F', 471, 'Naked'),
(3, 'Panigale V4', 1103, 'Deportiva'),
(4, 'R 1250 GS', 1254, 'Touring');

INSERT INTO motocicletas_cliente (cliente_id, modelo_id, placa, anio_fabricacion, color) VALUES
(1, 1, 'M-101AAA', 2022, 'Negro'),
(1, 2, 'M-102BBB', 2021, 'Azul'),
(2, 3, 'M-103CCC', 2023, 'Rojo'),
(3, 4, 'M-104DDD', 2024, 'Rojo'),
(3, 5, 'M-105EEE', 2022, 'Blanco'),
(4, 1, 'M-106FFF', 2020, 'Gris');

INSERT INTO servicios_mantenimiento (moto_id, fecha_servicio, tipo_servicio, costo_mano_obra_usd, costo_repuestos_usd, estado_servicio) VALUES
(1, '2026-03-01', 'Cambio de Aceite y Filtros', 35.00, 45.00, 'Completado'),
(1, '2026-05-10', 'Ajuste de Cadena y Frenos', 50.00, 30.00, 'Completado'),
(1, '2026-07-15', 'Mantenimiento General', 120.00, 180.00, 'Completado'),
(2, '2026-04-12', 'Cambio de Llantas', 60.00, 220.00, 'Completado'),
(2, '2026-06-20', 'Sincronización de Motor', 150.00, 90.00, 'Completado'),
(3, '2026-03-18', 'Revision Básica', 30.00, 15.00, 'Completado'),
(4, '2026-05-02', 'Mantenimiento de Suspensión', 200.00, 350.00, 'Completado'),
(4, '2026-08-01', 'Cambio de Pastillas de Freno', 40.00, 80.00, 'Completado'),
(5, '2026-07-05', 'Diagnóstico Eléctrico', 80.00, 40.00, 'Completado');