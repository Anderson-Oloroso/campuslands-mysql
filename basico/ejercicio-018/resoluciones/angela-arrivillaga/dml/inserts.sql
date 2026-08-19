USE agencia_viajes_db;

INSERT INTO destinos_turisticos (nombre_destino, pais, continente) VALUES
('Kyoto Historico', 'Japon', 'Asia'),
('Paris Romantico', 'Francia', 'Europa'),
('Cartagena de Indias', 'Colombia', 'America del Sur'),
('Cusco y Machu Picchu', 'Peru', 'America del Sur'),
('Bali Tropical', 'Indonesia', 'Asia');

INSERT INTO paquetes_turisticos (codigo_referencia, nombre_paquete, id_destino, duracion_dias, precio_base, cupos_disponibles, estado_paquete) VALUES
('PK-ASIA-01', 'Aventura Milenaria en Kyoto', 1, 7, 1250.00, 15, 'activo'),
('PK-EUR-01', 'Escapada Romantica en Paris', 2, 5, 1450.00, 8, 'activo'),
('PK-CAR-01', 'Sol y Brisa en Cartagena Colonial', 3, 4, 650.00, 25, 'activo'),
('PK-SAM-01', 'Ruta Inka hacia Machu Picchu', 4, 6, 980.00, 12, 'activo'),
('PK-ASIA-02', 'Retiro Espiritual en Bali', 5, 10, 1100.00, 0, 'agotado'),
('PK-SAM-02', 'Eje Cafetero y Aventura Andina', 3, 5, 520.00, 20, 'proximamente'),
('PK-EUR-02', 'Alpes Franceses y Gastronomia', 2, 8, 1890.00, 10, 'activo'),
('PK-ASIA-03', 'Cerezos en Flor por Japon', 1, 12, 2100.00, 4, 'activo');