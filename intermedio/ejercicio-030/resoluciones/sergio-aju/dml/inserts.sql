USE campuslands_mysql;

-- Inserción masiva de Bodegas (Datos de soporte)
INSERT INTO bodegas_streaming (nombre_bodega, ciudad, capacidad_maxima) VALUES
('Bodega Central Norte', 'Guatemala City', 1500),
('Centro de Distribución Occidente', 'Quetzaltenango', 800),
('Hub Logístico Sur', 'Escuintla', 1000);

-- Inserción masiva y estructurada de equipos de streaming (Mínimo 8 registros con casos variados)
INSERT INTO inventario_streaming (codigo_serial, nombre_equipo, categoria, precio_compra, precio_venta, stock_actual, bodega_id, estado_inventario, fecha_ingreso) VALUES
('STR-9001', 'Elgato Stream Deck MK.2', 'Stream Deck', 110.00, 149.99, 25, 1, 'activo', '2026-07-10'),
('STR-9002', 'Shure SM7B Studio Mic', 'Microfono', 300.00, 399.00, 10, 1, 'activo', '2026-07-12'),
('STR-9003', 'Logitech Brio 4K Webcam', 'Camara', 150.00, 199.99, 18, 2, 'activo', '2026-07-15'),
('STR-9004', 'Elgato Key Light Air', 'Iluminacion', 95.00, 129.99, 15, 1, 'en_transito', '2026-08-01'),
('STR-9005', 'Rode PodMic Broadcast', 'Microfono', 75.00, 99.00, 30, 3, 'activo', '2026-08-05'),
('STR-9006', 'Sony Alpha ZV-E10 Mirrorless', 'Camara', 550.00, 699.99, 5, 2, 'activo', '2026-06-20'),
('STR-9007', 'Elgato Cam Link 4K Capture', 'Capturadora', 95.00, 129.99, 12, 1, 'revision', '2026-08-10'),
('STR-9008', 'Focusrite Scarlett 2i2 Gen 4', 'Audio Interface', 130.00, 179.99, 20, 3, 'activo', '2026-08-12');