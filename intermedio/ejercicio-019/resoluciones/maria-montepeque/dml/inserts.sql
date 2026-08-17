-- Datos de practica: saltos de paracaidismo por instructor y alumno.
USE campuslands_mysql;

INSERT INTO saltos_intermedio (instructor, alumno, tipo_salto, altura_metros, costo, fecha_salto, estado) VALUES
('Sofia Herrera', 'Camila Ortiz', 'tandem', 4000, 250.00, '2026-01-05', 'completado'),
('Sofia Herrera', 'Julian Vega', 'tandem', 4000, 250.00, '2026-01-12', 'completado'),
('Sofia Herrera', 'Andres Molina', 'tandem', 4000, 250.00, '2026-02-15', 'cancelado'),
('Mateo Duarte', 'Nicolas Prada', 'formacion', 4500, 300.00, '2026-02-01', 'reprogramado'),
('Mateo Duarte', 'Isabella Cruz', 'estilo_libre', 3500, 280.00, '2026-02-10', 'completado'),
('Valentina Rios', 'Camila Ortiz', 'solo', 3000, 150.00, '2026-03-01', 'completado'),
('Valentina Rios', 'Julian Vega', 'formacion', 4500, 300.00, '2026-03-08', 'completado'),
('Sofia Herrera', 'Camila Ortiz', 'tandem', 4000, 250.00, '2026-03-15', 'completado'),
('Mateo Duarte', 'Nicolas Prada', 'formacion', 4500, 300.00, '2026-02-01', 'completado'),
('Valentina Rios', 'Isabella Cruz', 'solo', 3000, 150.00, '2026-03-22', 'completado');
