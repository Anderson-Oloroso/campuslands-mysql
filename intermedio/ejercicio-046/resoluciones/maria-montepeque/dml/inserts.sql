-- Datos de practica: platos y combos de un restaurante de comida urbana.
USE campuslands_mysql;

INSERT INTO platos_intermedio (nombre_plato, categoria, precio) VALUES
('Hamburguesa Clasica', 'plato_fuerte', 22000.00),
('Tacos de Asada', 'plato_fuerte', 18500.00),
('Alitas BBQ', 'plato_fuerte', 20000.00),
('Papas Fritas Clasicas', 'acompanamiento', 8000.00),
('Aros de Cebolla', 'acompanamiento', 10000.00),
('Limonada de Coco', 'bebida', 9000.00);

INSERT INTO combos_intermedio (nombre_combo, id_plato_principal, id_plato_acompanamiento, precio_combo, disponible) VALUES
('Combo Clasico', 1, 4, 27000.00, TRUE),
('Combo Doble Papa', 1, 5, 29000.00, TRUE),
('Combo Tacos Refrescante', 2, 6, 25000.00, TRUE),
('Combo Alitas Aros', 3, 5, 27500.00, FALSE),
('Combo Tacos Papa', 2, 4, 24000.00, TRUE);
