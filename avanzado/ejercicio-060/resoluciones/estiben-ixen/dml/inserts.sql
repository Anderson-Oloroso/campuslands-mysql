-- Insercion de datos para equipo de streaming (ejercicio-060)
USE campuslands_mysql;

-- Insercion en canales_streamers
INSERT INTO canales_streamers (nickname, plataforma_principal, seguidores) VALUES
('IbaiLlanos', 'Twitch', 15800000),
('AuronPlay', 'Twitch', 16200000),
('ElRubiusOMG', 'Twitch', 14900000),
('ElMariana', 'Twitch', 9800000),
('RiversGG', 'Twitch', 6500000),
('Shroud', 'Twitch', 10800000);

-- Insercion en dispositivos_setup
INSERT INTO dispositivos_setup (nombre_hardware, id_streamer, tipo_dispositivo, marca, precio_usd, puerto_conexion, estado) VALUES
('Sony Alpha A7 IV + Lente 24-70mm f/2.8', 1, 'Camara / Lente', 'Sony', 2800.00, 'HDMI 2.1', 'En Uso'),
('Shure SM7B Microfono Dinamico Cardioide', 1, 'Microfono XLR', 'Shure', 399.00, 'XLR', 'En Uso'),
('Rodecaster Pro II Interfaz de Audio', 1, 'Interfaz de Audio', 'Rode', 699.00, 'USB-C', 'En Uso'),
('Elgato Stream Deck XL 32 Teclas', 2, 'Controlador / Stream Deck', 'Elgato', 249.99, 'USB-C', 'En Uso'),
('Sony FX3 Cinema Line Camera', 2, 'Camara / Lente', 'Sony', 3900.00, 'HDMI 2.1', 'En Uso'),
('Elgato Key Light Air x2 Paneles LED', 2, 'Iluminacion KeyLight', 'Elgato', 260.00, 'Wi-Fi', 'En Uso'),
('Elgato 4K60 Pro MK.2 Capturadora PCIe', 3, 'Capturadora de Video', 'Elgato', 249.00, 'PCIe', 'En Uso'),
('Electro-Voice RE20 Broadcast Mic', 3, 'Microfono XLR', 'Electro-Voice', 449.00, 'XLR', 'En Uso'),
('Elgato Cam Link 4K USB Dongle', 4, 'Capturadora de Video', 'Elgato', 99.00, 'USB-C', 'En Uso'),
('Cloudlifter CL-1 Amplificador de Ganancia', 4, 'Interfaz de Audio', 'Cloud Microphones', 149.00, 'XLR', 'En Uso'),
('Sony A6400 Mirrorless + Sigma 16mm f/1.4', 5, 'Camara / Lente', 'Sony', 1250.00, 'HDMI 2.1', 'En Uso'),
('Audio-Technica AT2020 USB+', 5, 'Microfono XLR', 'Audio-Technica', 120.00, 'USB-C', 'En Uso');

