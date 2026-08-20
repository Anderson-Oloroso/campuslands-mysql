USE campuslands_mysql;

INSERT INTO platos (
    nombre,
    categoria,
    precio,
    calorias,
    estado,
    fecha_ingreso
)
VALUES
    ('Hamburguesa Clasica', 'Hamburguesas', 28.00, 720, 'disponible', '2026-01-10'),
    ('Hamburguesa BBQ', 'Hamburguesas', 34.50, 850, 'disponible', '2026-01-15'),
    ('Hamburguesa Picante', 'Hamburguesas', 32.00, 790, 'agotado', '2026-02-05'),
    ('Pizza Personal', 'Pizzas', 25.00, 680, 'disponible', '2026-02-10'),
    ('Pizza Pepperoni', 'Pizzas', 31.50, 760, 'disponible', '2026-02-15'),
    ('Tacos de Pollo', 'Tacos', 22.00, 540, 'disponible', '2026-03-01'),
    ('Tacos al Pastor', 'Tacos', 24.00, 590, 'agotado', '2026-03-05'),
    ('Hot Dog Especial', 'Hot Dogs', 20.00, 610, 'disponible', '2026-03-10'),
    ('Papas Cargadas', 'Acompanamientos', 18.50, 480, 'disponible', '2026-03-15'),
    ('Alitas BBQ', 'Alitas', 36.00, 900, 'disponible', '2026-03-20');