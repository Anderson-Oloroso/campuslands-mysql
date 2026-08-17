-- DML: Inserción de catálogo de ropa e historial parcial de ventas
USE campuslands_mysql;

-- Inserción de 8 productos en catálogo
INSERT INTO productos_ropa_left (codigo_sku, nombre, categoria, precio, stock) VALUES
('CAM-MAN-001', 'Camisa Formal Manga Larga', 'camisas', 45.00, 30),
('PAN-EXE-002', 'Pantalón de Vestir Ejecutivo', 'pantalones', 55.00, 20),
('TRA-AZU-003', 'Traje Completo Azul Marino', 'chaquetas', 180.00, 10),
('TAC-CLA-004', 'Tacones Negros Clásicos', 'calzado', 65.00, 15),
('CHA-BLA-005', 'Chaqueta Blazer Casual', 'chaquetas', 75.00, 12),
('VES-NOC-006', 'Vestido de Noche Elegante', 'vestidos', 110.00, 5),
('CHA-FOR-007', 'Chaleco Formal Ajustado', 'camisas', 38.00, 18),
('COR-SED-008', 'Corbata de Seda Ejecutiva', 'accesorios', 22.50, 40);

-- Registros de ventas (algunos productos no registrarán ventas intencionalmente)
INSERT INTO detalle_ventas_left (producto_id, cliente_nombre, cantidad, fecha_venta) VALUES
(1, 'Carlos Mendoza', 2, '2026-07-10 11:00:00'),
(1, 'Valeria Gómez', 1, '2026-07-12 14:30:00'),
(2, 'Mateo Fernández', 1, '2026-07-15 16:20:00'),
(3, 'Sofia López', 1, '2026-07-18 10:15:00'),
(4, 'Lucía Gómez', 2, '2026-07-20 18:00:00'),
(7, 'Andrea Torres', 1, '2026-07-22 15:45:00');
