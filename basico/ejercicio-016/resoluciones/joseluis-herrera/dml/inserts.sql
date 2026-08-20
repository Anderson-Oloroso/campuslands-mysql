USE campuslands_mysql;

INSERT INTO platos
    (nombre, categoria, precio, disponible, fecha_registro)
VALUES
    ('Hamburguesa Clásica', 'Hamburguesas', 18.50, TRUE, '2026-08-01'),
    ('Hamburguesa BBQ', 'Hamburguesas', 24.00, TRUE, '2026-08-02'),
    ('Hot Dog Especial', 'Hot Dogs', 15.00, TRUE, '2026-08-03'),
    ('Papas con Cheddar', 'Acompañamientos', 12.50, TRUE, '2026-08-04'),
    ('Alitas BBQ', 'Alitas', 28.00, TRUE, '2026-08-05'),
    ('Tacos de Pollo', 'Tacos', 20.00, TRUE, '2026-08-06'),
    ('Nachos Supremos', 'Acompañamientos', 22.00, FALSE, '2026-08-07'),
    ('Hamburguesa Doble', 'Hamburguesas', 30.00, TRUE, '2026-08-08'),
    ('Quesadilla de Pollo', 'Quesadillas', 19.50, FALSE, '2026-08-09'),
    ('Combo Urbano', 'Combos', 35.00, TRUE, '2026-08-10');