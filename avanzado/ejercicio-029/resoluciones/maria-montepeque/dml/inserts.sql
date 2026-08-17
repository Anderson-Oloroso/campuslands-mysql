-- Datos de practica: ofertas relampago de un marketplace de accesorios.
-- Las fechas se calculan relativas a NOW() a proposito: este ejercicio
-- es sobre automatizacion basada en tiempo, asi que interesa que
-- algunas ofertas ya esten vencidas sin importar cuando se ejecute
-- este script.
USE campuslands_mysql;

INSERT INTO ofertas_avanzado (producto, categoria, precio_original, precio_oferta, fecha_inicio, fecha_fin, estado) VALUES
('Collar de Perlas', 'collares', 120.00, 80.00, DATE_SUB(NOW(), INTERVAL 30 DAY), DATE_SUB(NOW(), INTERVAL 5 DAY), 'programada'),
('Pulsera de Plata', 'pulseras', 60.00, 40.00, DATE_SUB(NOW(), INTERVAL 20 DAY), DATE_SUB(NOW(), INTERVAL 2 DAY), 'activa'),
('Aretes de Oro', 'aretes', 200.00, 150.00, DATE_SUB(NOW(), INTERVAL 10 DAY), DATE_ADD(NOW(), INTERVAL 5 DAY), 'activa'),
('Anillo Solitario', 'anillos', 300.00, 220.00, DATE_SUB(NOW(), INTERVAL 5 DAY), DATE_ADD(NOW(), INTERVAL 10 DAY), 'activa'),
('Bolso de Cuero', 'bolsos', 250.00, 180.00, DATE_ADD(NOW(), INTERVAL 2 DAY), DATE_ADD(NOW(), INTERVAL 15 DAY), 'programada'),
('Collar Minimalista', 'collares', 90.00, 65.00, DATE_SUB(NOW(), INTERVAL 15 DAY), DATE_SUB(NOW(), INTERVAL 1 DAY), 'activa'),
('Pulsera Trenzada', 'pulseras', 45.00, 30.00, DATE_ADD(NOW(), INTERVAL 1 DAY), DATE_ADD(NOW(), INTERVAL 8 DAY), 'programada'),
('Aretes Colgantes', 'aretes', 110.00, 85.00, DATE_SUB(NOW(), INTERVAL 8 DAY), DATE_ADD(NOW(), INTERVAL 3 DAY), 'activa');
