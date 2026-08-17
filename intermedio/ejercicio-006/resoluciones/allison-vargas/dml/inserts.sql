-- DML: Registro de 8 hiperdeportivos y sus características atómicas en 1FN
USE campuslands_mysql;

INSERT INTO hiperdeportivos_intermedio 
(marca, modelo, motor, precio_usd, estado) 
VALUES
('Bugatti', 'Chiron Super Sport', '8.0L W16 Quad-Turbo', 3800000.00, 'disponible'),
('Koenigsegg', 'Jesko Absolut', '5.0L V8 Twin-Turbo', 3400000.00, 'reservado'),
('Pagani', 'Huayra BC', '6.0L V12 Twin-Turbo', 2800000.00, 'vendido'),
('Rimac', 'Nevera', 'Cuatro Motores Eléctricos', 2400000.00, 'disponible'),
('Ferrari', 'SF90 XX Stradale', '4.0L V8 Hybrid', 890000.00, 'disponible'),
('McLaren', 'Speedtail', '4.0L V8 Hybrid', 2250000.00, 'vendido'),
('Aston Martin', 'Valkyrie', 2022, 6.5L V12 Atmosférico', 3200000.00, 'reservado'),
('Hennessey', 'Venom F5', '6.6L V8 Twin-Turbo', 2100000.00, 'disponible');

-- Inserción de equipamientos en 1FN (Un registro por cada característica atómica)
INSERT INTO equipamientos_hiperdeportivos 
(auto_id, caracteristica, categoria) 
VALUES
(1, 'Alerón Trasero Activo', 'aerodinamica'),
(1, 'Chasis de Fibra de Carbono', 'rendimiento'),
(1, 'Frenos Carbocerámicos', 'seguridad'),
(2, 'Suspensión Triplex Koenigsegg', 'rendimiento'),
(2, 'Transmisión LST de 9 Velocidades', 'rendimiento'),
(3, 'Escape Cuádruple de Titanio', 'rendimiento'),
(3, 'Interior en Cuero Artesanal', 'interior'),
(4, 'Vectorización de Par All-Wheel Drive', 'rendimiento'),
(4, 'Batería de 120 kWh integrada', 'rendimiento'),
(5, 'Alerón Fijo Deportivo XX', 'aerodinamica'),
(6, 'Carrocería de Fibra de Carbono Flexible', 'aerodinamica');
