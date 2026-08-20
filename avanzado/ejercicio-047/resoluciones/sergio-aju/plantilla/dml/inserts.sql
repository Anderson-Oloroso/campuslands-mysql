-- Carga inicial de datos de prueba
USE campuslands_mysql;

-- Inserción de Clientes
INSERT INTO clientes (nombre, email, tipo_cliente) VALUES
('Elena Rostova', 'elena.rostova@email.com', 'vip'),
('Mateo Fernández', 'mateo.f@email.com', 'regular'),
('Lucía Méndez', 'lucia.mendez@email.com', 'vip'),
('Gabriel Solares', 'g.solares@email.com', 'regular');

-- Inserción de Prendas / Inventario
INSERT INTO prendas (nombre, categoria, talla, color, precio, stock, estado) VALUES
('Chaqueta de Cuero Biker', 'chaquetas', 'M', 'Negro', 350.00, 8, 'disponible'),
('Camisa Oversize Algodón', 'camisas', 'L', 'Blanco', 120.00, 15, 'disponible'),
('Jeans Slim Fit Denim', 'pantalones', '32', 'Azul Oscuro', 180.00, 12, 'disponible'),
('Botines Urbanos de Cuero', 'calzado', '41', 'Negro', 280.00, 5, 'disponible'),
('T-Shirt Graphic Streetwear', 'camisas', 'M', 'Negro', 85.00, 20, 'disponible'),
('Pantalón Cargo Ripstop', 'pantalones', '30', 'Verde Olivo', 195.00, 10, 'disponible'),
('Hoodie Minimalist Fleece', 'chaquetas', 'XL', 'Gris', 160.00, 6, 'disponible'),
('Cinturón de Cuero Formal', 'accesorios', 'Única', 'Café', 65.00, 0, 'agotado');

-- Invocación de Procedimientos Almacenados para poblar ventas reales
CALL sp_registrar_venta(1, 1, 1); -- Cliente VIP (Elena) compra Chaqueta Biker (Recibe 10% Desc)
CALL sp_registrar_venta(2, 2, 2); -- Cliente Regular (Mateo) compra 2 Camisas Oversize
CALL sp_registrar_venta(3, 3, 1); -- Cliente VIP (Lucía) compra Jeans Slim Fit
CALL sp_registrar_venta(4, 5, 3); -- Cliente Regular (Gabriel) compra 3 T-Shirts