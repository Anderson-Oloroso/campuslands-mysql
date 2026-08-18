-- Datos de practica para tienda de ropa (LEFT JOIN).
USE campuslands_mysql;

INSERT INTO intermedio_ejercicio_017_prendas (nombre, categoria, precio) 
    VALUES ('Camiseta Basica Blanca', 'Camisetas', 12.99),
    ('Pantalon Denim Azul', 'Pantalones', 39.99),
    ('Chaqueta Cuero Negra', 'Chaquetas', 89.99),
    ('Vestido Floral', 'Vestidos', 29.50),
    ('Zapatillas Deportivas', 'Calzado', 59.99),
    ('Bufanda Lana', 'Accesorios', 15.00),
    ('Gorra Logo', 'Accesorios', 18.50),
    ('Abrigo Invierno', 'Chaquetas', 110.00);

INSERT INTO intermedio_ejercicio_017_ventas (prenda_id, cantidad, fecha_venta) 
    VALUES (1, 2, '2026-08-15'),
    (1, 1, '2026-08-16'),
    (2, 1, '2026-08-16'),
    (3, 1, '2026-08-17'),
    (5, 3, '2026-08-17'),
    (1, 4, '2026-08-18'),
    (2, 2, '2026-08-18');