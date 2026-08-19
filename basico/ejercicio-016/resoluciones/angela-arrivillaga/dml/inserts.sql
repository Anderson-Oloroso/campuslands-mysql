USE restaurante_urbano_db;

INSERT INTO categorias_menu (nombre_categoria, descripcion) VALUES
('Hamburguesas Artesanales', 'Hamburguesas jugosas con pan de papa y carnes a la parrilla'),
('Salchipapas Especiales', 'Papas fritas crujientes con salsas de la casa y carnes mixtas'),
('Perros Calientes', 'Hot dogs estilo urbano con aderezos y toppings variados'),
('Bebidas y Refrescos', 'Gaseosas, jugos naturales y malteadas artesanales');

INSERT INTO productos_urbana (nombre_producto, id_categoria, precio, calorias, estado_disponibilidad) VALUES
('Burger Doble Tocineta', 1, 24.99, 950, 'disponible'),
('Burger Crispy Chicken', 1, 21.50, 820, 'disponible'),
('Salchipapa Urbana Suprema', 2, 19.99, 1100, 'disponible'),
('Salchipapa Ranchera', 2, 18.00, 980, 'agotado'),
('Hot Dog Monster Cheese', 3, 14.50, 750, 'disponible'),
('Hot Dog BBQ Ahumado', 3, 15.00, 720, 'proximamente'),
('Malteada de Nutella', 4, 9.50, 600, 'disponible'),
('Limonada de Coco', 4, 7.00, 350, 'disponible');