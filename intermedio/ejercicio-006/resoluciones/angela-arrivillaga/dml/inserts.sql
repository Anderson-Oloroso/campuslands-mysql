USE campuslands_mysql;

-- Inserción de 8 registros atómicos en la tabla principal (cumpliendo 1FN)
INSERT INTO autos_hiperdeportivos (marca, modelo, velocidad_maxima_kmh, precio_millones_usd, estado, anio_lanzamiento) VALUES
('Bugatti', 'Chiron Super Sport', 440, 3.90, 'disponible', 2022),
('Koenigsegg', 'Jesko Absolut', 480, 3.00, 'reservado', 2023),
('Rimac', 'Nevera', 412, 2.20, 'vendido', 2021),
('Pagani', 'Huayra BC', 380, 2.50, 'disponible', 2017),
('McLaren', 'Speedtail', 403, 2.25, 'vendido', 2020),
('Lamborghini', 'Revuelto', 350, 0.60, 'disponible', 2024),
('Hennessey', 'Venom F5', 484, 2.10, 'reservado', 2021),
('Aston Martin', 'Valkyrie', 360, 3.20, 'vendido', 2022);

-- Inserción de registros en la tabla relacionada para descomponer atributos múltiples de colores (atomicidad 1FN)
INSERT INTO especificaciones_colores (auto_id, color_disponible) VALUES
(1, 'Negro Nocturno'),
(1, 'Azul Carbón'),
(2, 'Blanco Platino'),
(2, 'Gris Titanio'),
(3, 'Azul Tormenta'),
(4, 'Oro Rosa'),
(5, 'Plata Líquida'),
(6, 'Verde Mantis'),
(7, 'Naranja Solar'),
(8, 'Rojo Racing');