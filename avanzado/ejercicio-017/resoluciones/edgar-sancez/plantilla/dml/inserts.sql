INSERT INTO clientes_tienda (nombre_cliente, correo, puntos_fidelidad) VALUES
('Ana Lucía Torres', 'ana.torres@email.com', 120),
('Carlos Roberto Gómez', 'carlos.gomez@email.com', 45),
('Sofía María Ramírez', 'sofia.ramirez@email.com', 300);

INSERT INTO categorias_ropa (nombre_categoria, departamento) VALUES
('Camisas y Blusas', 'Casuales'),
('Pantalones y Jeans', 'Casuales'),
('Chaquetas y Abrigos', 'Exterior');

INSERT INTO prendas_inventario (categoria_id, codigo_sku, nombre_prenda, talla, color, precio_unitario, stock_actual) VALUES
(1, 'CAM-SLIM-01', 'Camisa Oxford Slim Fit', 'M', 'Azul Marino', 35.00, 25),
(1, 'BLU-SEDA-02', 'Blusa de Seda Casual', 'S', 'Blanco', 42.50, 15),
(2, 'JEA-SLI-03', 'Jeans Denim Slim', 'L', 'Azul Oscuro', 55.00, 30),
(3, 'CHQ-CUERO-04', 'Chaqueta Estilo Cuero', 'M', 'Negro', 120.00, 10);

INSERT INTO ventas (cliente_id, fecha_venta, monto_total, estado_venta) VALUES
(1, '2026-08-15 10:30:00', 70.00, 'Completada'),
(2, '2026-08-16 14:15:00', 55.00, 'Completada');

INSERT INTO ventas_detalle (venta_id, prenda_id, cantidad, precio_historico, subtotal) VALUES
(1, 1, 2, 35.00, 70.00),
(2, 3, 1, 55.00, 55.00);