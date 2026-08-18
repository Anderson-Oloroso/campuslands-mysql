USE campuslands_mysql;

INSERT INTO productos
    (nombre, categoria, talla, precio, stock, disponible, fecha_ingreso)
VALUES
    ('Camiseta Básica Blanca', 'Camisetas', 'M', 45.00, 20, TRUE, '2026-08-01'),
    ('Camiseta Oversize Negra', 'Camisetas', 'L', 65.00, 15, TRUE, '2026-08-02'),
    ('Pantalón Cargo', 'Pantalones', '32', 150.00, 10, TRUE, '2026-08-03'),
    ('Jeans Clásico Azul', 'Pantalones', '34', 180.00, 8, TRUE, '2026-08-04'),
    ('Sudadera Urbana', 'Sudaderas', 'L', 125.00, 12, TRUE, '2026-08-05'),
    ('Chaqueta Denim', 'Chaquetas', 'M', 220.00, 5, TRUE, '2026-08-06'),
    ('Gorra Urbana', 'Accesorios', 'Única', 55.00, 18, TRUE, '2026-08-07'),
    ('Bufanda Tejida', 'Accesorios', 'Única', 40.00, 0, FALSE, '2026-08-08'),
    ('Vestido Casual', 'Vestidos', 'S', 175.00, 7, TRUE, '2026-08-09'),
    ('Camisa Formal', 'Camisas', 'M', 110.00, 9, TRUE, '2026-08-10');