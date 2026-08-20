USE campuslands_mysql;

INSERT INTO categorias
    (nombre)
VALUES
    ('Camisetas'),
    ('Pantalones'),
    ('Sudaderas'),
    ('Chaquetas'),
    ('Accesorios'),
    ('Vestidos');

INSERT INTO productos
    (id_categoria, nombre, talla, precio, stock, disponible, fecha_ingreso)
VALUES
    (1, 'Camiseta Básica Blanca', 'M', 45.00, 20, TRUE, '2026-08-01'),
    (1, 'Camiseta Oversize Negra', 'L', 65.00, 15, TRUE, '2026-08-02'),
    (2, 'Pantalón Cargo', '32', 150.00, 10, TRUE, '2026-08-03'),
    (2, 'Jeans Clásico Azul', '34', 180.00, 8, TRUE, '2026-08-04'),
    (3, 'Sudadera Urbana', 'L', 125.00, 12, TRUE, '2026-08-05'),
    (4, 'Chaqueta Denim', 'M', 220.00, 5, TRUE, '2026-08-06'),
    (5, 'Gorra Urbana', 'Única', 55.00, 18, TRUE, '2026-08-07'),
    (5, 'Bufanda Tejida', 'Única', 40.00, 0, FALSE, '2026-08-08'),
    (6, 'Vestido Casual', 'S', 175.00, 7, TRUE, '2026-08-09'),
    (1, 'Camiseta Deportiva', 'S', 75.00, 4, TRUE, '2026-08-10');