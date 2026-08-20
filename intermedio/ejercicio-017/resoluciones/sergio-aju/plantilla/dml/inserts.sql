USE campuslands_mysql;

-- Inserción de Categorías (incluye categorías sin productos asignados para probar LEFT JOIN)
INSERT INTO categorias (id, nombre, estado) VALUES
(1, 'Camisetas', 'activo'),
(2, 'Pantalones', 'activo'),
(3, 'Chaquetas', 'activo'),
(4, 'Calzado', 'activo'),      -- Categoría sin productos asociados
(5, 'Accesorios', 'inactivo');  -- Categoría inactiva sin productos asociados

-- Inserción de Productos (8 productos, incluyendo algunos sin categoría)
INSERT INTO productos (categoria_id, nombre, talla, precio, stock, estado) VALUES
(1, 'Camiseta Oversize Negra', 'L', 25.00, 15, 'activo'),
(1, 'Camiseta Basic Blanca', 'M', 18.00, 20, 'activo'),
(2, 'Jeans Slim Fit', 'M', 45.00, 10, 'activo'),
(2, 'Pantalon Cargo Verde', 'S', 40.00, 8, 'activo'),
(3, 'Chaqueta de Mezclilla', 'L', 65.00, 5, 'activo'),
(3, 'Hoodie Urbano Negro', 'XL', 50.00, 12, 'activo'),
(NULL, 'Cinturon de Cuero', 'M', 20.00, 15, 'activo'),   -- Producto sin categoría
(NULL, 'Gorra Urbana Negra', 'S', 15.00, 25, 'activo');   -- Producto sin categoría