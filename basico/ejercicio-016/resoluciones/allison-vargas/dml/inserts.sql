-- DML: Registro de platillos en el menú
USE campuslands_mysql;

INSERT INTO menu_urbano (nombre, categoria, precio, es_vegetariano, disponible) VALUES
('Smash Burger Doble', 'hamburguesa', 8.50, FALSE, TRUE),
('Tacos de Birria', 'tacos', 7.00, FALSE, TRUE),
('Street Hot Dog Gigante', 'hot_dog', 5.50, FALSE, TRUE),
('Papas Rústicas Trufadas', 'acompañamiento', 4.00, TRUE, TRUE),
('Limonada Artesanal', 'bebida', 2.50, TRUE, TRUE),
('Burger Vegana de Garbanzo', 'hamburguesa', 8.00, TRUE, TRUE),
('Tacos al Pastor Veganos', 'tacos', 6.50, TRUE, FALSE),
('Churros Urbanos con Chocolate', 'postre', 3.50, TRUE, TRUE);
