-- Datos de practica: catalogo de repuestos de un taller mecanico de motos.
USE campuslands_mysql;

INSERT INTO repuestos_basico (nombre, categoria, marca_compatible, precio, disponible) VALUES
('Pastillas de Freno Delanteras', 'frenos', 'Yamaha', 25.00, TRUE),
('Kit de Arrastre (Cadena y Piñones)', 'motor', 'Honda', 65.00, TRUE),
('Amortiguador Trasero', 'suspension', 'Kawasaki', 120.00, TRUE),
('Bateria 12V', 'electrico', 'Universal', 45.00, TRUE),
('Espejo Retrovisor Izquierdo', 'carroceria', 'Suzuki', 18.00, FALSE),
('Filtro de Aceite', 'motor', 'Yamaha', 8.50, TRUE),
('Disco de Freno Trasero', 'frenos', 'Honda', 55.00, TRUE),
('Regulador de Voltaje', 'electrico', 'Kawasaki', 32.00, FALSE),
('Carenado Lateral Derecho', 'carroceria', 'Suzuki', 90.00, TRUE);
