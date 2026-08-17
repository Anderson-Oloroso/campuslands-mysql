-- Datos de practica: pruebas de un laboratorio de formulas quimicas.
USE campuslands_mysql;

INSERT INTO pruebas_lab_basico (nombre, tipo_reaccion, cantidad_muestras, costo_reactivos, resultado, fecha_prueba) VALUES
('Sintesis de Acido Acetilsalicilico', 'sintesis', 13, 90.00, 'exitoso', '2026-01-10'),
('Descomposicion de Clorato de Potasio', 'descomposicion', 9, 42.00, 'exitoso', '2026-01-15'),
('Combustion de Metanol', 'combustion', 7, 32.00, 'fallido', '2026-01-20'),
('Neutralizacion Cloridrico-Hidroxido', 'neutralizacion', 16, 58.00, 'exitoso', '2026-02-01'),
('Oxidacion de Cobre', 'oxidacion', 11, 27.00, 'en_analisis', '2026-02-10'),
('Sintesis de Poliester', 'sintesis', 10, 125.00, 'exitoso', '2026-02-18'),
('Descomposicion de Bicarbonato', 'descomposicion', 8, 37.00, 'fallido', '2026-03-01'),
('Combustion de Propano', 'combustion', 12, 50.00, 'exitoso', '2026-03-05'),
('Neutralizacion con Bicarbonato', 'neutralizacion', 6, 22.00, 'en_analisis', '2026-03-12');
