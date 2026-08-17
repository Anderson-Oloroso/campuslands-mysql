-- Datos de practica: servicios de un garaje de motos.
-- Se muestran dos formas validas de INSERT en MySQL.
USE campuslands_mysql;

-- Forma 1: INSERT multi-fila con lista de columnas explicita.
INSERT INTO servicios_moto_basico (moto_marca, moto_modelo, tipo_servicio, mecanico, costo, fecha_servicio) VALUES
('Yamaha', 'MT-07', 'mantenimiento', 'Pedro Ariza', 120.00, '2026-01-05'),
('Honda', 'CB500F', 'cambio_aceite', 'Sofia Herrera', 45.00, '2026-01-08'),
('Kawasaki', 'Ninja 400', 'reparacion', 'Pedro Ariza', 280.00, '2026-01-12'),
('Suzuki', 'GSX-S750', 'revision_general', 'Camila Ortiz', 90.00, '2026-01-15'),
('Yamaha', 'R3', 'personalizacion', 'Julian Vega', 350.00, '2026-01-20'),
('Honda', 'CB500F', 'mantenimiento', 'Sofia Herrera', 110.00, '2026-02-01'),
('Kawasaki', 'Z900', 'cambio_aceite', 'Pedro Ariza', 50.00, '2026-02-05');

-- Forma 2: INSERT ... SET, util para insertar una sola fila columna a columna.
INSERT INTO servicios_moto_basico
SET moto_marca = 'Suzuki',
    moto_modelo = 'V-Strom 650',
    tipo_servicio = 'revision_general',
    mecanico = 'Camila Ortiz',
    costo = 95.00,
    fecha_servicio = '2026-02-10';
