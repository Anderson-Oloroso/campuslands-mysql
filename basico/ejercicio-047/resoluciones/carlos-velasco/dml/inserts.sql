USE campuslands_mysql;

INSERT INTO productos_ropa
    (nombre, categoria, talla, color, precio, stock, fecha_ingreso, disponible)
VALUES
    ('Camiseta Oversize Urban', 'Camisetas', 'M', 'Negro', 24.90, 18, '2026-01-15', TRUE),
    ('Camiseta Basica Classic', 'Camisetas', 'L', 'Blanco', 19.90, 25, '2026-01-20', TRUE),
    ('Pantalon Cargo Street', 'Pantalones', 'M', 'Verde', 54.90, 10, '2026-02-03', TRUE),
    ('Jean Slim Denim', 'Pantalones', '32', 'Azul', 59.90, 7, '2026-02-10', TRUE),
    ('Chaqueta Bomber Night', 'Chaquetas', 'L', 'Negro', 89.90, 5, '2026-02-18', TRUE),
    ('Sudadera Essential', 'Sudaderas', 'M', 'Gris', 49.90, 12, '2026-03-01', TRUE),
    ('Gorra Urban Cap', 'Accesorios', 'Unica', 'Rojo', 22.50, 20, '2026-03-05', TRUE),
    ('Hoodie Street Premium', 'Sudaderas', 'L', 'Azul', 69.90, 8, '2026-03-12', TRUE),
    ('Camisa Casual Linen', 'Camisas', 'M', 'Beige', 44.90, 0, '2026-03-20', FALSE),
    ('Short Deportivo Flex', 'Shorts', 'L', 'Negro', 34.90, 15, '2026-04-02', TRUE);