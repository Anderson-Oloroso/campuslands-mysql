-- Datos de practica: experimentos de un laboratorio de formulas quimicas.
USE campuslands_mysql;

INSERT INTO experimentos_basico (nombre, tipo_reaccion, cantidad_muestras, costo_reactivos, resultado, fecha_experimento) VALUES
('Sintesis de Aspirina', 'sintesis', 12, 85.00, 'exitoso', '2026-01-10'),
('Descomposicion de Peroxido', 'descomposicion', 8, 40.00, 'exitoso', '2026-01-15'),
('Combustion de Etanol', 'combustion', 6, 30.00, 'fallido', '2026-01-20'),
('Neutralizacion Acido-Base', 'neutralizacion', 15, 55.00, 'exitoso', '2026-02-01'),
('Oxidacion de Hierro', 'oxidacion', 10, 25.00, 'en_analisis', '2026-02-10'),
('Sintesis de Nylon', 'sintesis', 9, 120.00, 'exitoso', '2026-02-18'),
('Descomposicion de Carbonato', 'descomposicion', 7, 35.00, 'fallido', '2026-03-01'),
('Combustion de Metano', 'combustion', 11, 48.00, 'exitoso', '2026-03-05'),
('Neutralizacion con Amoniaco', 'neutralizacion', 5, 20.00, 'en_analisis', '2026-03-12');
