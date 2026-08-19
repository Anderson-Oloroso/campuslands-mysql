USE equipo_streaming_db;

INSERT INTO marcas_streaming (nombre_marca, pais_origen, sitio_web) VALUES
('Elgato', 'Alemania', 'https://www.elgato.com'),
('Shure', 'Estados Unidos', 'https://www.shure.com'),
('Logitech G', Suiza, 'https://www.logitechg.com'),
('Rode', 'Australia', 'https://www.rode.com'),
('HyperX', 'Estados Unidos', 'https://www.hyperxgaming.com');

INSERT INTO equipo_streaming (codigo_equipo, nombre_equipo, tipo_equipo, id_marca, precio_usd, estado_operativo) VALUES
('STR-001', 'Stream Deck MK.2', 'Interfaz', 1, 149.99, 'activo'),
('STR-002', 'Microfono Shure SM7B', 'Microfono', 2, 399.00, 'activo'),
('STR-003', 'Camara Facecam Pro 4K', 'Camara', 1, 299.99, 'activo'),
('STR-004', 'Luces Key Light Air', 'Iluminacion', 1, 129.99, 'en_reparacion'),
('STR-005', 'Microfono PodMic USB', 'Microfono', 4, 199.00, 'activo'),
('STR-006', 'Capturadora 4K60 Pro', 'Capturadora', 1, 249.99, 'respuesto'),
('STR-007', 'Audifonos Cloud Alpha Wireless', 'Audio', 5, 169.99, 'activo'),
('STR-008', 'Camara Brio 4K Stream', 'Camara', 3, 199.99, 'retirado');