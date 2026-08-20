USE campuslands_mysql;

-- Limpieza de tablas manteniendo el orden de las FK
TRUNCATE TABLE equipos_streaming;
DELETE FROM marcas_streaming;

-- Inserción de marcas de streaming
INSERT INTO marcas_streaming (id, nombre_marca, pais_origen) VALUES
(1, 'Elgato', 'Alemania'),
(2, 'Shure', 'Estados Unidos'),
(3, 'Logitech G', Suiza),
(4, 'Razer', 'Estados Unidos'),
(5, 'Sony', 'Japón');

-- Inserción de al menos 8 equipos de streaming asociados a las marcas
INSERT INTO equipos_streaming (codigo_equipo, nombre_dispositivo, id_marca, tipo_equipo, precio_usd, estado_operativo) VALUES
('STR-001', 'Stream Deck MK.2', 1, 'Stream Deck', 149.99, 'activo'),
('STR-002', 'Shure SM7B', 2, 'Microfono', 399.00, 'activo'),
('STR-003', 'Logitech Brio 4K', 3, 'Camara', 199.99, 'activo'),
('STR-004', 'Razer Key Light Chroma', 4, 'Iluminacion', 299.99, 'nuevo'),
('STR-005', 'Elgato Cam Link 4K', 1, 'Capturadora', 129.99, 'activo'),
('STR-006', 'Sony Alpha ZV-E10', 5, 'Camara', 699.99, 'en_reparacion'),
('STR-007', 'Shure MV7', 2, 'Microfono', 249.00, 'activo'),
('STR-008', 'Elgato Key Light Air', 1, 'Iluminacion', 129.99, 'retirado');