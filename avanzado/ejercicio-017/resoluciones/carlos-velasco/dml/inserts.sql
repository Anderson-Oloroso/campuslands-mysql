-- ============================================================
-- Ejercicio 017 - Datos iniciales
-- Base de datos: campuslands_mysql
-- ============================================================

USE campuslands_mysql;

-- ------------------------------------------------------------
-- Productos
-- ------------------------------------------------------------
INSERT INTO productos (
    nombre,
    categoria,
    talla,
    precio,
    stock,
    estado
)
VALUES
    ('Camiseta Basica', 'camisetas', 'M', 35.00, 25, 'activo'),
    ('Camiseta Oversize', 'camisetas', 'L', 48.00, 18, 'activo'),
    ('Pantalon Cargo', 'pantalones', '32', 85.00, 12, 'activo'),
    ('Jean Clasico', 'pantalones', '34', 95.00, 8, 'activo'),
    ('Chaqueta Denim', 'chaquetas', 'M', 140.00, 6, 'activo'),
    ('Sudadera Urbana', 'sudaderas', 'L', 110.00, 15, 'activo'),
    ('Gorra Urbana', 'accesorios', 'U', 30.00, 20, 'activo'),
    ('Cinturon Cuero', 'accesorios', 'U', 55.00, 9, 'activo'),
    ('Vestido Casual', 'vestidos', 'S', 120.00, 7, 'activo'),
    ('Camisa Formal', 'camisas', 'M', 75.00, 10, 'inactivo');


-- ------------------------------------------------------------
-- Ventas
-- ------------------------------------------------------------
INSERT INTO ventas (
    cliente,
    fecha_venta,
    estado,
    total
)
VALUES
    ('Laura Martinez', '2026-08-10 10:15:00', 'completada', 83.00),
    ('Andres Lopez', '2026-08-10 11:30:00', 'completada', 140.00),
    ('Camila Rodriguez', '2026-08-11 14:20:00', 'completada', 180.00),
    ('Daniel Gomez', '2026-08-11 16:45:00', 'completada', 95.00),
    ('Sofia Hernandez', '2026-08-12 12:10:00', 'pendiente', 110.00),
    ('Mateo Castillo', '2026-08-13 18:05:00', 'completada', 170.00),
    ('Valentina Perez', '2026-08-14 13:40:00', 'cancelada', 55.00),
    ('Nicolas Ramirez', '2026-08-15 17:50:00', 'completada', 150.00);


-- ------------------------------------------------------------
-- Detalles de las ventas
-- ------------------------------------------------------------
INSERT INTO detalle_venta (
    id_venta,
    id_producto,
    cantidad,
    precio_unitario
)
VALUES
    (1, 1, 1, 35.00),
    (1, 7, 1, 30.00),
    (1, 8, 1, 55.00),

    (2, 5, 1, 140.00),

    (3, 6, 1, 110.00),
    (3, 7, 1, 30.00),
    (3, 1, 1, 35.00),

    (4, 4, 1, 95.00),

    (5, 6, 1, 110.00),

    (6, 3, 1, 85.00),
    (6, 2, 1, 48.00),
    (6, 7, 1, 30.00),

    (7, 8, 1, 55.00),

    (8, 9, 1, 120.00),
    (8, 7, 1, 30.00);