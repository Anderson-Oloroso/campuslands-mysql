-- Datos de practica. Puedes cambiarlos o agregar mas filas.
USE campuslands_mysql;


INSERT INTO productos_ropa (nombre_prenda, categoria, talla, color, precio, stock_disponible) VALUES
('Chaqueta de Mezclilla Oversize', 'Chaquetas', 'L', 'Azul Claro', 59.99, 15),
('Playera Básica Algodón', 'Camisetas', 'M', 'Negro', 15.50, 50),
('Jeans Slim Fit', 'Pantalones', 'S', 'Negro', 39.90, 20),
('Tennis Urbanos Streetwear', 'Calzado', 'L', 'Blanco', 85.00, 8);


INSERT INTO ventas (id_producto, cantidad, metodo_pago) VALUES
(2, 3, 'Efectivo'),     
(1, 1, 'Tarjeta'),      
(4, 1, 'Transferencia'); 
