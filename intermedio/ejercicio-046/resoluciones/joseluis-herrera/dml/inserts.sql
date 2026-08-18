USE campuslands_mysql;

INSERT INTO categorias (nombre)
VALUES
    ('Hamburguesas'),
    ('Pizzas'),
    ('Tacos'),
    ('Hot Dogs'),
    ('Acompanamientos');

INSERT INTO platos (
    nombre,
    precio,
    calorias,
    estado,
    id_categoria
)
VALUES
    ('Hamburguesa Clasica', 28.00, 720, 'disponible', 1),
    ('Hamburguesa BBQ', 34.50, 850, 'disponible', 1),
    ('Pizza Personal', 25.00, 680, 'disponible', 2),
    ('Pizza Pepperoni', 31.50, 760, 'agotado', 2),
    ('Tacos de Pollo', 22.00, 540, 'disponible', 3),
    ('Tacos al Pastor', 24.00, 590, 'agotado', 3),
    ('Hot Dog Especial', 20.00, 610, 'disponible', 4),
    ('Hot Dog BBQ', 23.50, 670, 'disponible', 4),
    ('Papas Cargadas', 18.50, 480, 'disponible', 5),
    ('Aros de Cebolla', 16.00, 430, 'agotado', 5);