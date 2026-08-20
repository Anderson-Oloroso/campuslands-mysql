USE campuslands_mysql;

-- Inserción de registros optimizados en el inventario
INSERT INTO inventario_streaming_avanzado (codigo_serial, nombre_equipo, categoria, precio_venta, stock_actual, estado) VALUES
('STR-A101', 'Elgato Stream Deck MK.2', 'Stream Deck', 149.99, 25, 'disponible'),
('STR-A102', 'Shure SM7B Studio Mic', 'Microfono', 399.00, 10, 'disponible'),
('STR-A103', 'Logitech Brio 4K Webcam', 'Camara', 199.99, 18, 'disponible'),
('STR-A104', 'Elgato Key Light Air', 'Iluminacion', 129.99, 0, 'agotado'),
('STR-A105', 'Rode PodMic Broadcast', 'Microfono', 99.00, 30, 'disponible'),
('STR-A106', 'Sony Alpha ZV-E10 Mirrorless', 'Camara', 699.99, 5, 'disponible'),
('STR-A107', 'Elgato Cam Link 4K Capture', 'Capturadora', 129.99, 12, 'revision'),
('STR-A108', 'Focusrite Scarlett 2i2 Gen 4', 'Audio Interface', 179.99, 20, 'disponible');

-- Inserción de registros en la tabla transaccional para pruebas de optimización y agregaciones
INSERT INTO transacciones_streaming_avanzado (equipo_id, cantidad_vendida, monto_total, fecha_transaccion) VALUES
(1, 2, 299.98, '2026-08-01'),
(2, 1, 399.00, '2026-08-05'),
(3, 3, 599.97, '2026-08-10'),
(5, 4, 396.00, '2026-08-12'),
(6, 1, 699.99, '2026-08-14'),
(8, 2, 359.98, '2026-08-15'),
(1, 1, 149.99, '2026-08-16'),
(3, 2, 399.98, '2026-08-17');