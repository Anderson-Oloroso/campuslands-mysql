-- Datos de practica: menu de un restaurante de comida urbana.
USE campuslands_mysql;

INSERT INTO platillos_urbanos_basico (nombre, categoria, precio, estado) VALUES
('Burger Clasica Urbana', 'hamburguesa', 32.50, 'disponible'),
('Burger Doble Queso', 'hamburguesa', 42.00, 'disponible'),
('Taco Callejero de Pastor', 'taco', 18.00, 'disponible'),
('Taco de Suadero', 'taco', 17.50, 'agotado'),
('Limonada de Coco', 'bebida', 15.00, 'disponible'),
('Agua de Jamaica', 'bebida', 12.00, 'disponible'),
('Brownie con Helado', 'postre', 20.00, 'disponible'),
('Papas Urbanas con Queso', 'acompanamiento', 22.00, 'descontinuado'),
('Churros Rellenos', 'postre', 19.50, 'disponible');
