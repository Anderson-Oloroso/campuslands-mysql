-- Datos de practica para restaurante de comida urbana (10 registros).
USE campuslands_mysql;

INSERT INTO basico_ejercicio_016_menu (nombre_plato, categoria, precio, es_vegetariano, disponible) 
    VALUES ('Smash Burger Doble', 'Hamburguesas', 8.50, FALSE, TRUE),
    ('Classic Hot Dog', 'Hot Dogs', 4.00, FALSE, TRUE),
    ('Papas Fritas con Queso y Tocino', 'Acompañamientos', 5.50, FALSE, TRUE),
    ('Veggie Burger de Lentejas', 'Hamburguesas', 7.00, TRUE, TRUE),
    ('Chili Dog Picante', 'Hot Dogs', 5.00, FALSE, TRUE),
    ('Aros de Cebolla Crujientes', 'Acompañamientos', 4.50, TRUE, TRUE),
    ('Refresco de Cola', 'Bebidas', 2.00, TRUE, TRUE),
    ('Limonada con Menta', 'Bebidas', 2.50, TRUE, TRUE),
    ('Milkshake de Vainilla', 'Postres', 4.00, TRUE, FALSE),
    ('Hamburguesa BBQ Crispy', 'Hamburguesas', 9.00, FALSE, TRUE);