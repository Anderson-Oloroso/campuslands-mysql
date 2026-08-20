USE campuslands_mysql;

-- 1. Carga de Marcas
INSERT INTO marcas (nombre_marca, pais_origen) VALUES
('Elgato', 'Alemania'),
('Shure', 'Estados Unidos'),
('Sony', 'Japón'),
('Logitech', 'Suiza'),
('Rode', 'Australia');

-- 2. Carga de Categorías de Equipos
INSERT INTO categorias_equipos (nombre_categoria, descripcion) VALUES
('Cámaras y Webcams', 'Cámaras DSLR, Mirrorless y Webcams 4K para transmisión'),
('Micrófonos', 'Micrófonos dinámicos y de condensador para producción de audio'),
('Capturadoras de Video', 'Dispositivos de captura HDMI a USB/PCIe'),
('Iluminación', 'Paneles LED, Softbox y Key Lights articulados'),
('Consolas de Mezcla y Stream Decks', 'Controladores macro y interfaces de audio XLR');

-- 3. Carga de Creadores / Streamers
INSERT INTO streamers (nickname, nombre_completo, plataforma_principal, correo, fecha_registro) VALUES
('DevSergi', 'Sergio Ajú', 'Twitch', 'sergio.aju@streamer.com', '2026-01-10'),
('TechMariana', 'Mariana López', 'YouTube', 'mariana.lopez@streamer.com', '2026-01-18'),
('GamerDavid', 'David Gómez', 'Kick', 'david.gomez@streamer.com', '2026-02-05'),
('AnaLive', 'Ana Morales', 'Twitch', 'ana.morales@streamer.com', '2026-02-12');

-- 4. Carga de Equipos de Streaming (Mínimo 8 registros requeridos)
INSERT INTO equipos_streaming (marca_id, categoria_id, modelo, numero_serie, precio_adquisicion, stock_almacen, resolucion_o_especificacion, estado, fecha_ingreso) VALUES
(1, 3, 'Cam Link 4K USB', 'ELG-CL4K-9901', 130.00, 5, '4K 30fps / 1080p 60fps', 'Disponible', '2026-02-01'),
(1, 5, 'Stream Deck MK.2 Black', 'ELG-SD15-4420', 150.00, 3, '15 teclas LCD personalizables', 'Asignado', '2026-02-01'),
(1, 4, 'Key Light Air Panel LED', 'ELG-KLA-1102', 130.00, 4, '1400 Lúmenes / Wi-Fi Control', 'Asignado', '2026-02-03'),
(2, 2, 'SM7B Dinámico Cardioide', 'SHU-SM7B-8831', 400.00, 2, 'Respuesta 50Hz - 20kHz XLR', 'Asignado', '2026-02-05'),
(2, 2, 'MV7 USB/XLR Podcast', 'SHU-MV7-8845', 250.00, 6, 'Patrón Cardioide Híbrido', 'Disponible', '2026-02-05'),
(3, 1, 'Alpha 6400 Mirrorless Body', 'SNY-A6400-3301', 900.00, 1, '4K HDR / Enfoque al ojo', 'Asignado', '2026-02-10'),
(4, 1, 'Brio 4K Pro Webcam', 'LOG-BRIO-7712', 200.00, 8, '4K Ultra HD / HDR', 'Disponible', '2026-02-12'),
(5, 5, 'Rodecaster Pro II Audio Console', 'RDE-RCP2-5509', 700.00, 1, '4 Entradas XLR / Bluetooth / DSP', 'En Mantenimiento', '2026-02-15');

-- 5. Carga de Asignaciones
INSERT INTO asignaciones_equipos (equipo_id, streamer_id, fecha_asignacion, estado_asignacion) VALUES
(2, 1, '2026-02-10 09:30:00', 'Activa'), -- Stream Deck a DevSergi
(3, 2, '2026-02-11 11:00:00', 'Activa'), -- Key Light a TechMariana
(4, 1, '2026-02-12 14:15:00', 'Activa'), -- SM7B a DevSergi
(6, 3, '2026-02-15 16:00:00', 'Activa'); -- Alpha 6400 a GamerDavid