USE campuslands_mysql;


INSERT INTO platos (
    nombre,
    categoria,
    precio,
    disponible,
    estado
) VALUES
    ('Hamburguesa Clasica', 'Hamburguesas', 28.50, TRUE, 'activo'),
    ('Hamburguesa BBQ', 'Hamburguesas', 34.00, TRUE, 'activo'),
    ('Perro Especial', 'Hot Dogs', 22.00, TRUE, 'activo'),
    ('Perro Mexicano', 'Hot Dogs', 25.50, TRUE, 'activo'),
    ('Papas Cheddar', 'Acompañamientos', 18.00, TRUE, 'activo'),
    ('Alitas Picantes', 'Alitas', 32.00, TRUE, 'activo'),
    ('Nachos Mixtos', 'Acompañamientos', 27.50, FALSE, 'activo'),
    ('Tacos Urbanos', 'Tacos', 30.00, TRUE, 'activo'),
    ('Combo Familiar', 'Combos', 65.00, TRUE, 'activo'),
    ('Brownie con Helado', 'Postres', 20.00, TRUE, 'inactivo');