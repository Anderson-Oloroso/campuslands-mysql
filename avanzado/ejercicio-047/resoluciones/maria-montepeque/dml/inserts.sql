-- Datos de practica: productos y ventas de una tienda de ropa,
-- registradas a traves del procedimiento sp_registrar_venta_ropa.
USE campuslands_mysql;

INSERT INTO productos_avanzado (nombre, categoria, precio_unitario) VALUES
('Camiseta Basica Blanca', 'camisetas', 35000.00),
('Jean Slim Azul', 'pantalones', 89000.00),
('Vestido Floral Verano', 'vestidos', 120000.00),
('Tenis Urbanos Negros', 'calzado', 175000.00),
('Chaqueta Impermeable', 'chaquetas', 145000.00);

-- Cada CALL calcula el total (con descuento por volumen si aplica),
-- inserta la venta y suma el total a los ingresos del producto dentro
-- de una transaccion.
CALL sp_registrar_venta_ropa(1, 8);
CALL sp_registrar_venta_ropa(1, 3);
CALL sp_registrar_venta_ropa(2, 1);
CALL sp_registrar_venta_ropa(2, 6);
CALL sp_registrar_venta_ropa(3, 2);
CALL sp_registrar_venta_ropa(4, 5);
CALL sp_registrar_venta_ropa(4, 2);
CALL sp_registrar_venta_ropa(3, 1);
CALL sp_registrar_venta_ropa(5, 3);
