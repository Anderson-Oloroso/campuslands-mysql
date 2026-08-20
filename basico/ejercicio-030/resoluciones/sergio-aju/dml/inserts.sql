USE campuslands_mysql;

-- Inserción de Marcas (Tabla Padre)
INSERT INTO marcas_streaming (nombre_marca, pais_origen, sitio_web) VALUES
('Elgato', 'Alemania', 'https://www.elgato.com'),
('Shure', 'Estados Unidos', 'https://www.shure.com'),
('Logitech G', Suiza, 'https://www.logitechg.com'),
('Rode', 'Australia', 'https://www.rode.com'),
('Sony', 'Japón', 'https://www.sony.com');

-- Inserción de Dispositivos (Tabla Hija - Mínimo 8 registros distribuidos)
INSERT INTO dispositivos_streaming (nombre_dispositivo, marca_id, tipo_dispositivo, precio_unitario, stock, estado) VALUES
('Stream Deck MK.2', 1, 'Stream Deck', 149.99, 15, 'disponible'),
('Wave:3 USB Microphone', 1, 'Microfono', 159.99, 8, 'disponible'),
('Shure SM7B Studio Microphone', 2, 'Microfono', 399.00, 4, 'disponible'),
('Logitech Brio 4K Webcam', 3, 'Camara', 199.99, 12, 'disponible'),
('Rode PodMic', 4, 'Microfono', 99.00, 20, 'disponible'),
('Sony Alpha ZV-E10', 5, 'Camara', 699.99, 3, 'disponible'),
('Elgato Key Light Air', 1, 'Iluminacion', 129.99, 0, 'agotado'),
('Elgato Cam Link 4K', 1, 'Capturadora', 129.99, 6, 'disponible');