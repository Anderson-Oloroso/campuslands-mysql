USE campuslands_mysql;

INSERT INTO prendas (
    nombre,
    categoria,
    talla,
    color,
    precio,
    stock,
    fecha_ingreso,
    estado,
    disponible
) VALUES
    ('Camiseta Basica', 'Camisetas', 'M', 'Negro', 45.00, 25, '2026-01-10', 'activo', TRUE),
    ('Camisa Oxford', 'Camisas', 'L', 'Blanco', 85.50, 12, '2026-01-15', 'activo', TRUE),
    ('Jean Clasico', 'Pantalones', '32', 'Azul', 150.00, 8, '2026-01-20', 'activo', TRUE),
    ('Pantalon Cargo', 'Pantalones', '34', 'Verde', 135.75, 5, '2026-02-03', 'activo', TRUE),
    ('Chaqueta Denim', 'Chaquetas', 'L', 'Azul', 210.00, 3, '2026-02-12', 'activo', TRUE),
    ('Vestido Casual', 'Vestidos', 'M', 'Rojo', 175.50, 7, '2026-02-18', 'activo', TRUE),
    ('Falda Plisada', 'Faldas', 'S', 'Negro', 120.00, 0, '2026-02-25', 'agotado', FALSE),
    ('Sudadera Urbana', 'Sudaderas', 'XL', 'Gris', 110.00, 15, '2026-03-01', 'activo', TRUE),
    ('Blusa Elegante', 'Blusas', 'S', 'Beige', 95.25, 10, '2026-03-08', 'activo', TRUE),
    ('Short Deportivo', 'Shorts', 'M', 'Negro', 70.00, 20, '2026-03-15', 'activo', TRUE);