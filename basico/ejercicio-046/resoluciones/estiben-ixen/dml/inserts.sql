-- Insercion de datos para restaurante de comida urbana (ejercicio-046)
USE campuslands_mysql;

INSERT INTO platillos_urbanos (nombre_platillo, id_categoria, precio, tiempo_preparacion_min, calorias, es_vegetariano, disponible) VALUES
('Double Bacon Smash Burger', 1, 12.50, 12, 850, 'No', 'Si'),
('Truffle Mushroom Burger', 1, 14.00, 15, 780, 'No', 'Si'),
('Beyond Veggie Burger', 1, 13.00, 14, 620, 'Si', 'Si'),
('Tacos al Pastor (Orden x3)', 2, 9.50, 10, 540, 'No', 'Si'),
('Tacos de Birria con Consome', 2, 11.00, 12, 680, 'No', 'Si'),
('Tacos de Hongos al Ajillo', 2, 8.50, 10, 390, 'Si', 'Si'),
('Buffalo Hot Wings (10 pcs)', 3, 11.50, 16, 720, 'No', 'Si'),
('Honey Mustard Tenders', 3, 10.00, 12, 650, 'No', 'Si'),
('Monster Pulled Pork Fries', 4, 10.50, 8, 920, 'No', 'Si'),
('Cheese & Garlic Fries', 4, 7.50, 7, 580, 'Si', 'Si'),
('Salted Caramel Shake', 5, 5.50, 5, 450, 'Si', 'Si'),
('Limonada de Frutos Rojos', 5, 4.00, 3, 120, 'Si', 'Si');
