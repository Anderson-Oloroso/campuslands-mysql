-- Datos de practica: inventario y ventas de una tienda de ropa,
-- registradas a traves del procedimiento sp_registrar_venta.
USE campuslands_mysql;

INSERT INTO productos_avanzado (nombre, categoria, precio, stock) VALUES
('Camisa Oxford Blanca', 'camisa', 45.00, 20),
('Camisa Casual a Cuadros', 'camisa', 39.90, 15),
('Pantalon Chino Beige', 'pantalon', 55.00, 18),
('Pantalon Jogger Negro', 'pantalon', 48.50, 10),
('Vestido Floral Verano', 'vestido', 62.00, 12),
('Chaqueta Denim Clasica', 'chaqueta', 75.00, 8),
('Chaqueta Impermeable', 'chaqueta', 90.00, 6),
('Cinturon de Cuero', 'accesorio', 25.00, 30);

-- Cada llamada valida stock, inserta la venta y descuenta inventario
-- dentro de una sola transaccion controlada por el procedimiento.
CALL sp_registrar_venta(1, 3);
CALL sp_registrar_venta(1, 2);
CALL sp_registrar_venta(2, 5);
CALL sp_registrar_venta(3, 4);
CALL sp_registrar_venta(5, 2);
CALL sp_registrar_venta(6, 3);
CALL sp_registrar_venta(8, 6);
CALL sp_registrar_venta(4, 1);
