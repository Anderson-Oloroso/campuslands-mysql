USE campuslands_mysql;

INSERT INTO productos
    (nombre, categoria, talla, precio, stock, disponible)
VALUES
    ('Camiseta Básica Blanca', 'Camisetas', 'M', 45.00, 20, TRUE),
    ('Camiseta Oversize Negra', 'Camisetas', 'L', 65.00, 15, TRUE),
    ('Pantalón Cargo', 'Pantalones', '32', 150.00, 10, TRUE),
    ('Jeans Clásico Azul', 'Pantalones', '34', 180.00, 8, TRUE),
    ('Sudadera Urbana', 'Sudaderas', 'L', 125.00, 12, TRUE),
    ('Chaqueta Denim', 'Chaquetas', 'M', 220.00, 5, TRUE),
    ('Gorra Urbana', 'Accesorios', 'Única', 55.00, 18, TRUE),
    ('Bufanda Tejida', 'Accesorios', 'Única', 40.00, 0, FALSE),
    ('Vestido Casual', 'Vestidos', 'S', 175.00, 7, TRUE),
    ('Camisa Formal', 'Camisas', 'M', 110.00, 9, TRUE);

INSERT INTO clientes
    (nombre, telefono)
VALUES
    ('Carlos Méndez', '5551-1001'),
    ('Ana López', '5551-1002'),
    ('Luis García', '5551-1003'),
    ('María Pérez', '5551-1004'),
    ('Sofía Ramírez', '5551-1005');

INSERT INTO ventas
    (id_cliente, fecha_venta, estado)
VALUES
    (1, '2026-08-10', 'Completada'),
    (2, '2026-08-11', 'Completada'),
    (3, '2026-08-12', 'Completada'),
    (1, '2026-08-13', 'Completada'),
    (4, '2026-08-14', 'Completada'),
    (5, '2026-08-15', 'Completada');

INSERT INTO detalle_venta
    (id_venta, id_producto, cantidad, precio_unitario)
VALUES
    (1, 1, 2, 45.00),
    (1, 7, 1, 55.00),
    (2, 2, 1, 65.00),
    (2, 3, 1, 150.00),
    (3, 4, 2, 180.00),
    (3, 5, 1, 125.00),
    (4, 6, 1, 220.00),
    (5, 1, 1, 45.00),
    (5, 10, 2, 110.00),
    (6, 9, 1, 175.00);