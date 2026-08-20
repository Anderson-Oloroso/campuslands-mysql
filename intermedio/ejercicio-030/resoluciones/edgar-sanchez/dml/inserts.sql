-- Datos de practica. Puedes cambiarlos o agregar mas filas.
USE campuslands_mysql;

INSERT INTO categorias_equipo (nombre_categoria, descripcion) VALUES
('Micrófonos', 'Micrófonos de condensador y dinámicos XLR o USB para captura vocal'),
('Cámaras y Webcams', 'Cámaras mirrorless, webcams 4K y tarjetas capturadoras de video'),
('Iluminación', 'Paneles LED, aros de luz y luces de acento controlables por software'),
('Controladores de Stream', 'Consolas con teclas LCD programables y mezcladores de audio dedicados');

INSERT INTO marcas_hardware (nombre_marca, pais_origen, sitio_web) VALUES
('Elgato', 'Alemania', 'https://www.elgato.com'),
('Shure', 'Estados Unidos', 'https://www.shure.com'),
('Logitech G', 'Suiza', 'https://www.logitechg.com'),
('Røde', 'Australia', 'https://www.rode.com');

INSERT INTO creadores_contenido (nombre_canal, plataforma_principal, correo_contacto, pais) VALUES
('PixelStreamer', 'Twitch', 'contacto@pixelstreamer.com', 'Guatemala'),
('TechZoneLive', 'YouTube', 'business@techzonelive.com', 'México'),
('StreamQueen', 'Twitch', 'info@streamqueen.gg', 'España'),
('KickMaster', 'Kick', 'admin@kickmaster.tv', 'Colombia');

INSERT INTO inventario_equipos (marca_id, categoria_id, modelo, codigo_sku, precio_usd, stock_almacen) VALUES
(2, 1, 'SM7B Dynamic Vocal Microphone', 'SHU-SM7B-01', 399.00, 12),
(1, 4, 'Stream Deck MK.2 15 Keys', 'ELG-SD15-02', 149.99, 25),
(1, 3, 'Key Light Air LED Panel', 'ELG-KLAIR-03', 129.99, 18),
(3, 2, 'Brio 4K Ultra HD Webcam', 'LOG-BRIO4K-01', 199.99, 8),
(4, 1, 'Rødecaster Pro II Audio Console', 'ROD-RCPRO2-01', 699.00, 5);

INSERT INTO asignaciones_setups (creador_id, equipo_id, fecha_adquisicion, cantidad, estado_equipo) VALUES
(1, 1, '2026-01-15', 1, 'Excelente'),
(1, 2, '2026-01-20', 1, 'Excelente'),
(1, 3, '2026-02-01', 2, 'Excelente'),
(2, 4, '2026-02-10', 1, 'Bueno'),
(2, 5, '2026-03-05', 1, 'Excelente'),
(3, 1, '2026-03-12', 1, 'Excelente'),
(3, 2, '2026-03-15', 1, 'Excelente'),
(4, 3, '2026-04-02', 1, 'Regular');