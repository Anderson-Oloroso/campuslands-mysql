-- Datos de practica: servicios de un garaje de motos por mecanico.
USE campuslands_mysql;

INSERT INTO servicios_taller_intermedio (mecanico, moto_marca, tipo_servicio, costo, fecha_servicio, estado) VALUES
('Pedro Ariza', 'Yamaha', 'mantenimiento', 120.00, '2026-01-05', 'completado'),
('Sofia Herrera', 'Honda', 'cambio_aceite', 45.00, '2026-01-08', 'completado'),
('Pedro Ariza', 'Kawasaki', 'reparacion', 280.00, '2026-01-12', 'completado'),
('Camila Ortiz', 'Suzuki', 'revision_general', 90.00, '2026-01-15', 'completado'),
('Julian Vega', 'Yamaha', 'personalizacion', 350.00, '2026-01-20', 'cancelado'),
('Sofia Herrera', 'Honda', 'mantenimiento', 110.00, '2026-02-01', 'completado'),
('Pedro Ariza', 'Kawasaki', 'cambio_aceite', 50.00, '2026-02-05', 'completado'),
('Camila Ortiz', 'Suzuki', 'revision_general', 95.00, '2026-02-10', 'en_proceso'),
('Pedro Ariza', 'Yamaha', 'reparacion', 260.00, '2026-02-05', 'completado'),
('Sofia Herrera', 'Honda', 'cambio_aceite', 48.00, '2026-02-20', 'completado');
