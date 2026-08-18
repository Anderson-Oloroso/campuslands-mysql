-- Insercion de datos para taller mecanico de motos (ejercicio-035)
USE campuslands_mysql;

-- 1. Insercion en tabla principal (mecanicos)
INSERT INTO mecanicos (nombre, especialidad, rango, estado) VALUES
('Roberto Mendoza', 'Motores y Cajas', 'Senior', 'Disponible'),
('Fernando Castillo', 'Sistema Electrico', 'Senior', 'Disponible'),
('Javier Morales', 'Frenos y Suspension', 'Intermedio', 'Disponible'),
('Daniel Ramos', 'Mantenimiento General', 'Junior', 'Ocupado'),
('Hugo Estrada', 'Inyeccion Electronica', 'Senior', 'Disponible'),
('Pablo Lemus', 'Carburacion y Ajuste', 'Intermedio', 'Vacaciones');

-- 2. Insercion en tabla secundaria (servicios_taller)
INSERT INTO servicios_taller (moto, placa, id_mecanico, descripcion, costo, estado, fecha_servicio) VALUES
('Honda CBR 600', 'M-441BBB', 1, 'Cambio de pistones y rectificacion', 450.00, 'Finalizado', '2025-01-10'),
('Yamaha R6', 'M-552CCC', 1, 'Ajuste de valvulas y sincronizacion', 280.00, 'Finalizado', '2025-01-12'),
('Kawasaki Ninja 650', 'M-663DDD', 2, 'Diagnostico de sensor TPS y ECU', 180.00, 'En Proceso', '2025-01-15'),
('KTM Duke 200', 'M-774EEE', 4, 'Cambio de aceite, filtro y bujia', 85.00, 'Finalizado', '2025-01-18'),
('BMW R1250 GS', 'M-885FFF', 5, 'Calibracion inyectores y escaneo', 350.00, 'Pendiente', '2025-01-20'),
('Suzuki V-Strom 650', 'M-996GGG', 3, 'Cambio de pastillas y liquido de frenos', 120.00, 'Finalizado', '2025-01-22'),
('Ducati Panigale V2', 'M-117HHH', 1, 'Overhaul completo motor', 850.00, 'En Proceso', '2025-01-25'),
('Yamaha MT-09', 'M-228III', 2, 'Instalacion de luces auxiliares y relay', 95.00, 'Finalizado', '2025-01-28'),
('Honda CB190R', 'M-339JJJ', 4, 'Mantenimiento preventivo 10k km', 110.00, 'Finalizado', '2025-02-01'),
('Kawasaki Z400', 'M-440KKK', 3, 'Cambio de retenedores de suspension delantera', 160.00, 'Pendiente', '2025-02-03'),
('Bajaj Pulsar NS200', 'M-551LLL', 4, 'Regulacion de clutch y cadena', 65.00, 'Finalizado', '2025-02-05'),
('Royal Enfield Himalayan', 'M-662MMM', 5, 'Reparacion modulo ABS y purgado', 290.00, 'En Proceso', '2025-02-08');
