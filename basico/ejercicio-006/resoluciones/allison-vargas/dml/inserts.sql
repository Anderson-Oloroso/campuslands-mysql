-- DML: Registro de 8 hiperdeportivos con atributos variados para pruebas de WHERE
USE campuslands_mysql;

INSERT INTO hiperdeportivos_basico 
(marca, modelo, anio, caballos_fuerza, precio_usd, transmision, disponible) 
VALUES
('Bugatti', 'Chiron Pur Sport', 2021, 1500, 3600000.00, 'secuencial', TRUE),
('Koenigsegg', 'Jesko Attack', 2022, 1600, 3000000.00, 'automatica', TRUE),
('Pagani', 'Huayra Roadster', 2020, 764, 2800000.00, 'secuencial', FALSE),
('Ferrari', 'LaFerrari', 2015, 963, 1400000.00, 'secuencial', FALSE),
('McLaren', 'P1', 2014, 916, 1150000.00, 'automatica', TRUE),
('Porsche', '918 Spyder', 2015, 887, 850000.00, 'automatica', TRUE),
('Aston Martin', 'Valkyrie', 2022, 1160, 3200000.00, 'secuencial', TRUE),
('Hennessey', 'Venom F5', 2023, 1817, 2100000.00, 'manual', TRUE);
