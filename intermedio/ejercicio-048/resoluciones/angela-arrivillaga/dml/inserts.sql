USE campuslands_mysql;

INSERT INTO destinos (nombre_destino, pais, continente) VALUES
('Kioto', 'Japón', 'Asia'),
('Paris', 'Francia', 'Europa'),
('Cusco', 'Perú', 'América del Sur'),
('Roma', 'Italia', 'Europa'),
('Cancún', 'México', 'América del Norte');

INSERT INTO paquetes_turisticos (destino_id, nombre_paquete, precio, duracion_dias, estado_paquete) VALUES
(1, 'Exploración Tradicional de Kioto', 1200.00, 7, 'disponible'),
(1, 'Kioto y Templos Milenarios', 1850.00, 10, 'disponible'),
(2, 'Romance en París', 1500.00, 5, 'disponible'),
(2, 'Gran Tour por Francia', 2800.00, 12, 'agotado'),
(3, 'Aventura en el Camino Inca', 950.00, 4, 'disponible'),
(3, 'Mitos y Leyendas de Cusco', 1350.00, 8, 'disponible'),
(4, 'Arte e Historia en Roma', 1100.00, 6, 'disponible'),
(5, 'Relax Total en Playas de Cancún', 800.00, 5, 'proximamente');