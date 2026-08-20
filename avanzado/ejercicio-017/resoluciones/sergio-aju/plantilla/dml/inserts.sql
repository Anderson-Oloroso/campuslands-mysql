USE campuslands_mysql;

-- Inserción directa de Categorías
INSERT INTO categorias (id, nombre, estado) VALUES
(1, 'Camisetas', 'activo'),
(2, 'Pantalones', 'activo'),
(3, 'Chaquetas', 'activo');

-- Inserción de 8 Productos haciendo uso del Stored Procedure sp_insertar_producto
CALL sp_insertar_producto(1, 'Camiseta Oversize Negra', 'L', 25.00, 15);
CALL sp_insertar_producto(1, 'Camiseta Basic Blanca', 'M', 18.00, 20);
CALL sp_insertar_producto(1, 'Camiseta Estampada Rock', 'S', 22.00, 5);
CALL sp_insertar_producto(2, 'Jeans Slim Fit Azul', 'M', 45.00, 10);
CALL sp_insertar_producto(2, 'Pantalon Cargo Verde', 'S', 40.00, 8);
CALL sp_insertar_producto(2, 'Short Jean Casual', 'M', 30.00, 12);
CALL sp_insertar_producto(3, 'Chaqueta de Mezclilla', 'L', 65.00, 4);
CALL sp_insertar_producto(3, 'Hoodie Urbano Negro', 'XL', 50.00, 10);

-- Prueba de actualización de stock mediante sp_actualizar_stock
CALL sp_actualizar_stock(3, 15); -- Aumenta stock de Camiseta Estampada Rock