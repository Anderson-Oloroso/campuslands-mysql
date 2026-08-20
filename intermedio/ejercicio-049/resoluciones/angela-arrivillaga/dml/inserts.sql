USE campuslands_mysql;

INSERT INTO zonas_salto (nombre_zona, pais, altitud_msnm) VALUES
('Skydive Interlaken', 'Suiza', 1000),
('Skydive Dubai', 'Emiratos Árabes Unidos', 15),
('Skydive Chicago', 'Estados Unidos', 220),
('Skydive Australia', 'Australia', 10);

INSERT INTO saltos (zona_id, nombre_paracaidista, altura_salto_pies, tiempo_caida_libre_seg, estado_salto) VALUES
(1, 'Felix Baumgartner', 15000, 60, 'completado'),
(1, 'Luke Aikins', 18000, 75, 'completado'),
(1, 'John Doe', 12000, 45, 'cancelado'),
(2, 'Hamdan Al Maktoum', 14000, 55, 'completado'),
(2, 'Sarah Connor', 13000, 50, 'completado'),
(3, 'Peter Parker', 15000, 60, 'completado'),
(3, 'Clark Kent', 16000, 65, 'completado'),
(4, 'Bruce Wayne', 14000, 55, 'pendiente');