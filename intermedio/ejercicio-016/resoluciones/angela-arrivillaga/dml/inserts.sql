USE restaurante_urbano_db;

INSERT INTO categorias_menu (nombre_categoria, descripcion_categoria) VALUES
('Hamburguesas Smash', 'Carnes jugosas aplastadas en plancha caliente con queso fundido'),
('Salchipapas Urbanas', 'Papas crujientes con salsas de la casa, carnes y toppings'),
('Tacos Callejeros', 'Tortillas de maiz con guisados tradicionales y toque moderno'),
('Bebidas y Sodas', 'Refrescos artesanales, limonadas y sodas saborizadas');

INSERT INTO platos_urbanos (codigo_plato, nombre_plato, id_categoria, precio, calorias, estado_plato) VALUES
('URB-001', 'Smash Burger Doble Cheddar', 1, 8.99, 850, 'disponible'),
('URB-002', 'Bacon Monster Smash', 1, 10.50, 1100, 'disponible'),
('URB-003', 'Salchipapa Suprema de la Casa', 2, 7.50, 950, 'disponible'),
('URB-004', 'Salchipapa Crispy Chicken', 2, 8.20, 920, 'nuevo'),
('URB-005', 'Tacos al Pastor Urbano (3 und)', 3, 6.99, 650, 'disponible'),
('URB-006', 'Tacos Birria con Consome', 3, 9.50, 780, 'disponible'),
('URB-007', 'Limonada Rosa de Fresa y Hierbabuena', 4, 3.50, 220, 'disponible'),
('URB-008', 'Soda Artesanal de Maracuya', 4, 3.80, 250, 'nuevo');