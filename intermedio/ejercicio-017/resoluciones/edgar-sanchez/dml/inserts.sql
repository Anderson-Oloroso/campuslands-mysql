INSERT INTO categorias_ropa (nombre_categoria, departamento) VALUES
('Camisetas y Tops', 'Unisex'),
('Pantalones Jeans', 'Caballeros'),
('Chaquetas y Abrigos', 'Damas'),
('Accesorios', 'Unisex');

INSERT INTO proveedores_ropa (nombre_proveedor, pais_origen, correo_contacto) VALUES
('Textiles del Pacífico', 'Guatemala', 'contacto@textilespacifico.com'),
('Denim Style Co.', 'México', 'ventas@denimstyle.com'),
('Moda Urbana S.A.', 'Colombia', 'info@modaurbana.co'),
('Accesorios Globales', 'España', 'soporte@accesoriosglobales.es');

INSERT INTO productos_ropa (categoria_id, proveedor_id, nombre_producto, talla, color, precio_venta_usd, stock_actual) VALUES
(1, 1, 'Camiseta Algodón Basic', 'M', 'Blanco', 15.00, 50),
(1, 1, 'Camiseta Algodón Basic', 'L', 'Negro', 15.00, 30),
(2, 2, 'Jeans Slim Fit', '32', 'Azul Oscuro', 45.00, 20),
(3, 3, 'Chaqueta Cuero Sintético', 'S', 'Negro', 85.00, 10),
(4, 4, 'Cinturón Cuero Clásico', 'Única', 'Café', 25.00, 15);

INSERT INTO clientes_tienda (nombre_cliente, correo, fecha_registro) VALUES
('Sofía Martínez', 'sofia.martinez@email.com', '2026-01-15'),
('Alejandro Gómez', 'alejandro.gomez@email.com', '2026-02-10'),
('Lucía Hernández', 'lucia.hernandez@email.com', '2026-03-05'),
('Mariano López', 'mariano.lopez@email.com', '2026-04-12');

INSERT INTO ventas_ropa (cliente_id, producto_id, cantidad, precio_unidad_usd, fecha_venta) VALUES
(1, 1, 2, 15.00, '2026-08-01 10:30:00'),
(1, 3, 1, 45.00, '2026-08-02 14:15:00'),
(2, 1, 1, 15.00, '2026-08-05 11:00:00'),
(3, 4, 1, 85.00, '2026-08-10 16:45:00');