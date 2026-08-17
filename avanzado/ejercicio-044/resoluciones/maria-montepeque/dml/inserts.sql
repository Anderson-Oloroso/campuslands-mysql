-- Datos de practica: transmisiones en vivo de episodios de una saga
-- de ciencia ficcion. Las fechas se calculan relativas a NOW() a
-- proposito: este ejercicio es sobre automatizacion basada en tiempo,
-- asi que interesa que algunas transmisiones ya esten vencidas sin
-- importar cuando se ejecute este script.
USE campuslands_mysql;

INSERT INTO transmisiones_avanzado (episodio, temporada, fecha_inicio, fecha_fin, estado) VALUES
('El Despertar de la Nebulosa', 1, DATE_SUB(NOW(), INTERVAL 30 DAY), DATE_SUB(NOW(), INTERVAL 5 DAY), 'programada'),
('La Sombra del Imperio', 1, DATE_SUB(NOW(), INTERVAL 20 DAY), DATE_SUB(NOW(), INTERVAL 2 DAY), 'en_vivo'),
('El Ultimo Portal', 1, DATE_SUB(NOW(), INTERVAL 10 DAY), DATE_ADD(NOW(), INTERVAL 5 DAY), 'en_vivo'),
('Cronicas de Andromeda', 2, DATE_SUB(NOW(), INTERVAL 5 DAY), DATE_ADD(NOW(), INTERVAL 10 DAY), 'en_vivo'),
('El Legado Estelar', 2, DATE_ADD(NOW(), INTERVAL 2 DAY), DATE_ADD(NOW(), INTERVAL 15 DAY), 'programada'),
('La Caida de Orion', 2, DATE_SUB(NOW(), INTERVAL 15 DAY), DATE_SUB(NOW(), INTERVAL 1 DAY), 'en_vivo'),
('Rebelion Cuantica', 3, DATE_ADD(NOW(), INTERVAL 1 DAY), DATE_ADD(NOW(), INTERVAL 8 DAY), 'programada'),
('El Origen Perdido', 3, DATE_SUB(NOW(), INTERVAL 8 DAY), DATE_ADD(NOW(), INTERVAL 3 DAY), 'en_vivo');
