USE campuslands_mysql;

INSERT INTO categorias (nombre)
VALUES
    ('Camisetas'),
    ('Pantalones'),
    ('Chaquetas'),
    ('Vestidos'),
    ('Accesorios'),
    ('Calzado');

INSERT INTO prendas (
    nombre,
    talla,
    precio,
    stock,
    disponible,
    id_categoria
)
VALUES
    ('Camiseta Basica', 'M', 45.00, 25, TRUE, 1),
    ('Camiseta Oversize', 'L', 65.00, 18, TRUE, 1),
    ('Camiseta Deportiva', 'S', 58.00, 10, TRUE, 1),
    ('Jeans Clasicos', '32', 120.00, 12, TRUE, 2),
    ('Jeans Slim', '30', 135.00, 8, TRUE, 2),
    ('Pantalon Cargo', '34', 145.00, 6, TRUE, 2),
    ('Chaqueta Denim', 'M', 180.00, 6, TRUE, 3),
    ('Chaqueta Impermeable', 'L', 220.00, 4, TRUE, 3),
    ('Vestido Casual', 'S', 95.00, 9, TRUE, 4),
    ('Vestido Elegante', 'M', 160.00, 3, TRUE, 4);