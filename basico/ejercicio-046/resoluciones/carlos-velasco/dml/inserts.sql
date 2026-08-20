USE campuslands_mysql;

INSERT INTO platos (
    nombre,
    categoria,
    precio,
    ingredientes_principales,
    disponible
) VALUES
(
    'Hamburguesa Clasica',
    'Hamburguesas',
    28.00,
    'Carne de res, queso, lechuga y tomate',
    TRUE
),
(
    'Hamburguesa BBQ',
    'Hamburguesas',
    34.00,
    'Carne de res, queso cheddar, tocino y salsa BBQ',
    TRUE
),
(
    'Hamburguesa Picante',
    'Hamburguesas',
    32.00,
    'Carne de res, jalapeno, queso y salsa picante',
    TRUE
),
(
    'Hot Dog Especial',
    'Hot Dogs',
    22.00,
    'Salchicha, queso, cebolla y salsa especial',
    TRUE
),
(
    'Hot Dog BBQ',
    'Hot Dogs',
    25.00,
    'Salchicha, tocino, cebolla y salsa BBQ',
    TRUE
),
(
    'Papas con Queso',
    'Acompanamientos',
    18.00,
    'Papas fritas y queso cheddar',
    TRUE
),
(
    'Alitas BBQ',
    'Alitas',
    35.00,
    'Alitas de pollo y salsa BBQ',
    TRUE
),
(
    'Alitas Picantes',
    'Alitas',
    36.00,
    'Alitas de pollo y salsa picante',
    TRUE
),
(
    'Nachos Especiales',
    'Entradas',
    27.00,
    'Totopos, queso, frijoles y jalapeno',
    TRUE
),
(
    'Wrap de Pollo',
    'Wraps',
    29.00,
    'Pollo, lechuga, tomate y aderezo',
    FALSE
);