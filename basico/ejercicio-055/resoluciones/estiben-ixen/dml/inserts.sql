-- Insercion de datos para laboratorio de formulas quimicas (ejercicio-055)
USE campuslands_mysql;

INSERT INTO reactivos_quimicos (nombre_quimico, formula_molecular, id_laboratorio, pureza_porcentaje, clasificacion_peligro, stock_gramos, temperatura_almacenamiento_c) VALUES
('Acido Sulfonico de Benceno', 'C6H6O3S', 1, 98.50, 'Corrosivo', 5000.00, 20),
('Hidroxido de Sodio Grado Reactivo', 'NaOH', 1, 99.00, 'Corrosivo', 15000.00, 22),
('Tetrahidrofurano Anhidro', 'C4H8O', 1, 99.90, 'Inflamable', 8000.00, 4),
('Clorhidrato de Morfina Purificado', 'C17H19NO3.HCl', 2, 99.80, 'Toxico', 500.00, -20),
('Acetonitrilo HPLC Grade', 'C2H3N', 2, 99.95, 'Inflamable', 20000.00, 18),
('Nitrato de Plata Cristalino', 'AgNO3', 3, 99.50, 'Comburente', 1200.00, 20),
('Acido Clorhidrico Concentrado 37%', 'HCl', 3, 37.00, 'Corrosivo', 25000.00, 15),
('Sulfato de Cobre Pentahidratado', 'CuSO4.5H2O', 4, 98.00, 'Toxico', 10000.00, 20),
('Etanol Absoluto 99.8%', 'C2H5OH', 4, 99.80, 'Inflamable', 50000.00, 20),
('Permanganato de Potasio', 'KMnO4', 3, 99.00, 'Comburente', 3000.00, 20),
('Azida de Sodio Ultrapura', 'NaN3', 2, 99.50, 'Explosivo', 250.00, 4),
('Cloruro de Sodio USP', 'NaCl', 4, 99.90, 'Inerte', 100000.00, 20);
