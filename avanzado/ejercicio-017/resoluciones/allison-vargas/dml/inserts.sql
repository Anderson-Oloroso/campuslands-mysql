-- DML: Carga inicial de prendas y ejecución de procedimientos almacenados
USE campuslands_mysql;

-- Inserción de 8 prendas en catálogo
INSERT INTO productos_ropa (nombre, categoria, talla, precio, stock) VALUES
('Camisa Formal Manga Larga', 'camisas', 'M', 45.00, 30),
('Camisa Formal Manga Larga', 'camisas', 'L', 45.00, 25),
('Pantalón de Vestir Ejecutivo', 'pantalones', 'M', 55.00, 20),
('Chaleco Formal Ajustado', 'camisas', 'S', 38.00, 15),
('Traje Completo Azul Marino', 'chaquetas', 'L', 180.00, 10),
('Tacones Negros Clásicos', 'calzado', 'M', 65.00, 12),
('Chaqueta Blazer Casual', 'chaquetas', 'S', 75.00, 18),
('Vestido de Noche Elegante', 'vestidos', 'M', 110.00, 8);

-- Ejecución de Procedimientos Almacenados (Simulación de Ventas)
CALL registrar_venta_ropa('Lucía Gómez', 1, 2);
CALL registrar_venta_ropa('Mariana López', 5, 1);
CALL registrar_venta_ropa('Andrea Torres', 3, 1);
CALL registrar_venta_ropa('Sofia Ramírez', 6, 1);

-- Reabastecimiento de prendas mediante procedimiento
CALL reabastecer_stock_ropa(8, 10);
