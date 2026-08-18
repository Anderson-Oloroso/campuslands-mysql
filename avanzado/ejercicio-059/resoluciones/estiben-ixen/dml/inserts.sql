-- Insercion de datos para marketplace de accesorios (ejercicio-059)
USE campuslands_mysql;

-- Insercion en vendedores_marketplace
INSERT INTO vendedores_marketplace (nombre_tienda, reputacion_estrellas, ventas_totales) VALUES
('TechGear Official Store', 4.90, 1540),
('GamingZone Express', 4.75, 980),
('ErgoDesk Living', 4.85, 620),
('AudioPro Direct', 4.95, 2100),
('RGB World Gadgets', 4.60, 450);

-- Insercion en productos_accesorios
INSERT INTO productos_accesorios (nombre_producto, id_vendedor, categoria, precio, stock, es_envio_gratis, valoracion_promedio) VALUES
('Teclado Mecanico Inalambrico 75% Gateron Brown', 1, 'Teclados y Mouses', 89.99, 45, 'Si', 4.80),
('Mouse Ergonomico Vertical Bluetooth', 1, 'Teclados y Mouses', 34.50, 60, 'Si', 4.60),
('Hub USB-C 8 en 1 4K HDMI PowerDelivery', 1, 'Cables y Hubs', 42.00, 100, 'Si', 4.70),
('Mousepad Gamer XXL Resistente al Agua', 2, 'Teclados y Mouses', 19.99, 150, 'No', 4.50),
('Headset Gamer 7.1 Surround con Microfono Desmontable', 2, 'Audio', 79.99, 35, 'Si', 4.75),
('Brazo Hidraulico Doble Monitor 32 Pulgadas', 3, 'Soportes y Ergonomia', 65.00, 25, 'Si', 4.90),
('Cojin Lumbar de Espuma Viscoelastica', 3, 'Soportes y Ergonomia', 28.50, 40, 'Si', 4.80),
('Audifonos In-Ear Hi-Fi con Cancelacion de Ruido ANC', 4, 'Audio', 129.99, 50, 'Si', 4.95),
('Microfono USB de Condensador con Brazo Articulado', 4, 'Audio', 59.99, 30, 'Si', 4.85),
('Barra de Luz Monitor con Sensor Tactil Anti-Reflejo', 5, 'Iluminacion RGB', 38.00, 80, 'Si', 4.65),
('Tira LED Neón Inteligente Wi-Fi 5 Metros', 5, 'Iluminacion RGB', 24.99, 90, 'No', 4.40),
('Mochila Impermeable para Laptop 17 Pulgadas con Puerto USB', 1, 'Mochilas y Fundas', 49.99, 35, 'Si', 4.70);

