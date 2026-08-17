-- Datos de practica: menu de un restaurante de comida urbana.
USE campuslands_mysql;

INSERT INTO platos_basico (nombre_plato, categoria, precio, calorias, disponible, fecha_creacion) VALUES
('Papas Callejeras', 'entrada', 12000.00, 420, TRUE, '2021-03-10'),
('Hamburguesa Clasica', 'plato_fuerte', 22000.00, 780, TRUE, '2019-07-01'),
('Tacos de Asada', 'plato_fuerte', 18500.00, 650, TRUE, '2020-11-15'),
('Alitas BBQ', 'entrada', 20000.00, 590, TRUE, '2018-05-20'),
('Brownie con Helado', 'postre', 14000.00, 520, TRUE, '2020-01-08'),
('Limonada de Coco', 'bebida', 9000.00, 210, TRUE, '2022-02-14'),
('Aros de Cebolla', 'acompanamiento', 10000.00, 380, FALSE, '2021-09-01'),
('Malteada de Chocolate', 'bebida', 13000.00, 460, TRUE, '2019-12-01'),
('Papas Fritas Clasicas', 'acompanamiento', 8000.00, 340, TRUE, '2022-06-30');
