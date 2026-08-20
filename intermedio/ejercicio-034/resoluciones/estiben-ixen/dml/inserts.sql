-- Insercion de datos para garaje de motos (ejercicio-034)
USE campuslands_mysql;

-- 1. Insercion en tabla principal (propietarios_motos)
INSERT INTO propietarios_motos (nombre, telefono, email, estado) VALUES
('Estiben Ixen', '5551-1234', 'estiben@example.com', 'Activo'),
('Maria Montepeque', '5552-5678', 'maria@example.com', 'Activo'),
('Carlos Velasco', '5553-9012', 'carlos@example.com', 'Activo'),
('Angela Arrivillaga', '5554-3456', 'angela@example.com', 'Activo'),
('Edgar Sanchez', '5555-7890', 'edgar@example.com', 'Revision'),
('Cleidy Perez', '5556-2345', 'cleidy@example.com', 'Activo'),
('Sergio Aju', '5557-6789', 'sergio@example.com', 'Inactivo'),
('Allison Vargas', '5558-0123', 'allison@example.com', 'Activo');

-- 2. Insercion en tabla secundaria (estacionamiento_motos)
INSERT INTO estacionamiento_motos (placa, modelo, espacio_parqueo, id_propietario, costo_hora, fecha_ingreso, estado) VALUES
('M-101AAA', 'Yamaha MT-07', 'A-01', 1, 15.00, '2025-02-15 08:00:00', 'Activo'),
('M-202BBB', 'Honda CB650R', 'A-02', 2, 18.50, '2025-02-15 08:30:00', 'Activo'),
('M-303CCC', 'Kawasaki Z900', 'A-03', 3, 20.00, '2025-02-15 09:00:00', 'Activo'),
('M-404DDD', 'KTM Duke 390', 'B-01', 4, 12.00, '2025-02-15 09:15:00', 'Activo'),
('M-505EEE', 'BMW F900R', 'B-02', 5, 22.00, '2025-02-15 10:00:00', 'Completado'),
('M-606FFF', 'Suzuki GSX-S750', 'B-03', 6, 16.50, '2025-02-15 10:30:00', 'Activo'),
('M-707GGG', 'Ducati Monster', 'C-01', 7, 25.00, '2025-02-15 11:00:00', 'Cancelado'),
('M-808HHH', 'Triumph Street Triple', 'C-02', 8, 24.00, '2025-02-15 11:30:00', 'Activo'),
('M-909III', 'Yamaha R3', 'C-03', 1, 10.00, '2025-02-15 12:00:00', 'Completado'),
('M-110JJJ', 'Honda CBR500R', 'D-01', 2, 14.00, '2025-02-15 12:30:00', 'Activo'),
('M-120KKK', 'Kawasaki Ninja 400', 'D-02', 3, 13.50, '2025-02-15 13:00:00', 'Activo'),
('M-130LLL', 'Royal Enfield Interceptor', 'D-03', 4, 17.00, '2025-02-15 13:30:00', 'Activo');
