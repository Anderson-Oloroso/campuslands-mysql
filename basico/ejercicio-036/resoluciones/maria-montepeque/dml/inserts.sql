-- Datos de practica: catalogo de un concesionario de autos hiperdeportivos.
USE campuslands_mysql;

INSERT INTO hiperdeportivos_basico (marca, modelo, anio, potencia_hp, velocidad_max_kmh, precio, estado) VALUES
('Ferrari', 'SF90 Stradale', 2023, 986, 340, 625000.00, 'disponible'),
('Lamborghini', 'Revuelto', 2024, 1015, 350, 608000.00, 'reservado'),
('McLaren', '750S', 2023, 740, 332, 324000.00, 'disponible'),
('Bugatti', 'Chiron', 2022, 1500, 420, 3200000.00, 'vendido'),
('Porsche', '911 GT2 RS', 2021, 700, 340, 315000.00, 'disponible'),
('Koenigsegg', 'Jesko', 2023, 1600, 480, 3400000.00, 'reservado'),
('Aston Martin', 'Valkyrie', 2022, 1160, 402, 3500000.00, 'vendido'),
('Ferrari', '296 GTB', 2023, 830, 330, 322000.00, 'disponible'),
('McLaren', 'Artura', 2024, 690, 330, 280000.00, 'disponible');
