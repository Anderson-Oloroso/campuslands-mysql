-- DML: Registro de prendas utilizando diversos tipos de datos
USE campuslands_mysql;

INSERT INTO inventario_ropa (codigo_sku, nombre, categoria, talla, color, precio, stock_disponible, en_oferta, fecha_ingreso) VALUES
('CAM-MAN-001', 'Camisa Formal Manga Larga', 'camisas', 'M', 'Blanco', 45.00, 25, FALSE, '2026-01-15'),
('PAN-EXE-002', 'Pantalón de Vestir Ejecutivo', 'pantalones', 'M', 'Negro', 55.00, 18, TRUE, '2026-02-10'),
('TRA-AZU-003', 'Traje Completo Azul Marino', 'chaquetas', 'L', 'Azul Marino', 180.00, 8, FALSE, '2026-03-01'),
('TAC-CLA-004', 'Tacones Negros Clásicos', 'calzado', 'M', 'Negro', 65.00, 12, TRUE, '2026-03-20'),
('CHA-BLA-005', 'Chaqueta Blazer Casual', 'chaquetas', 'S', 'Beige', 75.00, 15, FALSE, '2026-04-05'),
('VES-NOC-006', 'Vestido de Noche Elegante', 'vestidos', 'M', 'Rojo', 110.00, 6, FALSE, '2026-05-12'),
('CHA-FOR-007', 'Chaleco Formal Ajustado', 'camisas', 'S', 'Gris', 38.00, 20, TRUE, '2026-06-01'),
('COR-SED-008', 'Corbata de Seda Ejecutiva', 'accesorios', 'S', 'Azul', 22.50, 40, FALSE, '2026-06-18');
